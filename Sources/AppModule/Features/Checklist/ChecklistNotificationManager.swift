import Foundation
@preconcurrency import UserNotifications

@MainActor
final class ChecklistNotificationManager: ObservableObject {

    static let shared = ChecklistNotificationManager()

    // MARK: Published

    @Published private(set) var isAuthorized = false

    @Published private(set) var hasRequestedPermission = false

    // MARK: Keys

    private let permissionAskedKey = "checklist_notif_permission_asked"
    private let lastScheduledKey = "checklist_notif_last_scheduled"
    private let notifCategoryID = "CHECKLIST_REMINDER"
    private let notifIdentifierPrefix = "checklist_missing_"

    private let reminderIntervalDays: Int = 7

    private init() {
        hasRequestedPermission = UserDefaults.standard.bool(forKey: permissionAskedKey)
        Task { await refreshAuthorizationStatus() }
    }

    // MARK: - Permission

    func refreshAuthorizationStatus() async {
        let settings = await UNUserNotificationCenter.current().notificationSettings()
        isAuthorized = settings.authorizationStatus == .authorized
    }

    func requestPermission() async {
        UserDefaults.standard.set(true, forKey: permissionAskedKey)
        hasRequestedPermission = true
        do {
            let granted = try await UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .sound, .badge])
            isAuthorized = granted
        } catch {
            isAuthorized = false
        }
    }

    // MARK: - Scheduling

    func scheduleRemindersIfNeeded(missingItems: [String], totalCount: Int) {
        guard isAuthorized else { return }
        guard !missingItems.isEmpty else {
            cancelAllReminders()
            return
        }

        if let last = UserDefaults.standard.object(forKey: lastScheduledKey) as? Date {
            let daysSince = Calendar.current.dateComponents([.day], from: last, to: Date()).day ?? 0
            if daysSince < reminderIntervalDays { return }
        }

        cancelAllReminders()
        scheduleReminders(for: missingItems)
        UserDefaults.standard.set(Date(), forKey: lastScheduledKey)
    }

    func cancelAllReminders() {
        let center = UNUserNotificationCenter.current()
        center.getPendingNotificationRequests { requests in
            let ids = requests
                .map(\.identifier)
                .filter { $0.hasPrefix(self.notifIdentifierPrefix) }
            center.removePendingNotificationRequests(withIdentifiers: ids)
        }
    }

    // MARK: - Private scheduling logic

    private func scheduleReminders(for missingItems: [String]) {
        let center = UNUserNotificationCenter.current()
        let shuffled = missingItems.shuffled()
        let schedules: [(daysFromNow: Int, item: String)] = [
            (7, shuffled[0]),
            (14, shuffled.count > 1 ? shuffled[1] : shuffled[0]),
            (21, shuffled.count > 2 ? shuffled[2] : shuffled[0])
        ]

        for (idx, schedule) in schedules.enumerated() {
            let content = UNMutableNotificationContent()
            content.sound = .default
            content.categoryIdentifier = notifCategoryID

            let remaining = missingItems.count

            if remaining == 1 {
                content.title = "One item missing from your kit 🩹"
                content.body = "You're almost ready! Add \"\(schedule.item)\" to complete your dog's first aid kit."
            } else {
                content.title = "\(remaining) items missing from your kit 🩹"
                let plural = remaining - 1 == 1 ? "" : "s"
                content.body = "Don't forget: \"\(schedule.item)\" — and \(remaining - 1) other item\(plural) " +
                "— could save your dog's life."
            }

            var triggerDate = Calendar.current.date(
                byAdding: .day, value: schedule.daysFromNow, to: Date()
            ) ?? Date()
            triggerDate = Calendar.current.date(
                bySettingHour: 10, minute: 0, second: 0, of: triggerDate
            ) ?? triggerDate

            let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: triggerDate)
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            let request = UNNotificationRequest(
                identifier: "\(notifIdentifierPrefix)\(idx)",
                content: content,
                trigger: trigger
            )

            center.add(request)
        }
    }
}
