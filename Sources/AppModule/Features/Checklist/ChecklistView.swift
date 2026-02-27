import SwiftUI

struct ChecklistItem: Identifiable, Hashable {
    let id          : String
    let description : String
    let usage       : String
}

struct IdentifiableString: Identifiable, Hashable {
    let id: String
}

struct ChecklistView: View {

    // MARK: Persistence

    @AppStorage("checkedChecklistItems")
    private var storedItemsData: Data = Data()

    // MARK: State

    @State private var checkedItems     : Set<String>         = []
    @State private var showConfetti     : Bool                = false
    @State private var selectedInfoItem : IdentifiableString? = nil

    @StateObject private var notifManager = ChecklistNotificationManager.shared

    // MARK: Data

    private let items: [ChecklistItem] = [
        ChecklistItem(
            id: "Gauze Pads (4x4) & rolls",
            description: "Sterile absorbent pads and gauze rolls to apply direct pressure and absorb blood.",
            usage: "BLEEDING: Press firmly on wound for 10+ minutes. Stack multiple pads. Secure with vet wrap."
        ),
        ChecklistItem(
            id: "Vet wrap & adhesive tape",
            description: "Self-adhering flexible bandage that sticks to itself, not fur. Stretches for secure fit.",
            usage: "BANDAGING: Wrap over gauze snugly (2 layers). Check toes stay pink/warm every 10 min."
        ),
        ChecklistItem(
            id: "Digital thermometer",
            description: "Rectal probe with flexible tip. Normal range: 101-102.5°F (38.3-39.2°C).",
            usage: "FEVER/SHOCK: Lubricate tip, insert 1 inch rectally. >103°F or <100°F = emergency."
        ),
        ChecklistItem(
            id: "Blunt scissors",
            description: "Safety rounded tips prevent cutting skin. Bandage/fur cutting only.",
            usage: "WOUNDS: Trim fur around injury for cleaning. Cut bandages without snagging skin."
        ),
        ChecklistItem(
            id: "Tweezers / forceps",
            description: "Pointed precision grip for small objects. Hemostat-style best.",
            usage: "SPLINTERS/TICKS: Grasp at skin level, steady pull. Never squeeze tick body."
        ),
        ChecklistItem(
            id: "Needleless syringes",
            description: "3ml+ plastic syringes without needle. Oral dosing or wound irrigation.",
            usage: "WOUND FLUSH: Fill with saline, flush debris. MEDS: Slow oral squirting side of mouth."
        ),
        ChecklistItem(
            id: "Saline solution (eye flush)",
            description: "Sterile 0.9% sodium chloride. Safe for eyes, wounds, mouth.",
            usage: "EYE/CHEMICAL: Flush continuously 10+ minutes. WOUNDS: Irrigate before bandaging."
        ),
        ChecklistItem(
            id: "Hydrogen peroxide (3%)",
            description: "Induces vomiting ONLY when vet instructs. Never for wounds/rinsing.",
            usage: "TOXINS: 1 tsp per 5 lbs body weight. ONLY if vet approves. Causes ulcers if misused."
        ),
        ChecklistItem(
            id: "Styptic powder (nail bleeds)",
            description: "Clotting agent for quick nail bleeding stop. Kwik-Stik brand ideal.",
            usage: "BROKEN NAILS: Dip bleeding tip into powder. Apply 30 seconds pressure."
        ),
        ChecklistItem(
            id: "Antiseptic wipes (no alcohol)",
            description: "Chlorhexidine or povidone-iodine impregnated. Kills bacteria without stinging.",
            usage: "MINOR CUTS: Clean around wound edges before bandaging. Avoid deep punctures."
        ),
        ChecklistItem(
            id: "Penlight / flashlight",
            description: "Focused beam for mouth, eyes, wounds. 100+ lumens minimum.",
            usage: "ASSESSMENT: Check gum color (pink normal), pupil response, wound depth."
        ),
        ChecklistItem(
            id: "Muzzles",
            description: "Quick-release fabric or basket style. Sizes for all breeds.",
            usage: "PAIN EMERGENCIES: Apply BEFORE treating injuries. Even sweet dogs bite when hurt."
        ),
    ]

    private var progress: Double {
        Double(checkedItems.count) / Double(items.count)
    }

    private var missingItems: [String] {
        items.filter { !checkedItems.contains($0.id) }.map(\.id)
    }

    // MARK: Body

    var body: some View {
        ZStack {
            List {

                Section {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("First Aid Kit Checklist")
                            .font(.title2.bold())

                        Text("Essential items for dog emergencies.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        ProgressView(value: progress)
                            .tint(.green)

                        Text("\(checkedItems.count) of \(items.count) items ready")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 8)
                }


                Section {
                    ForEach(items) { item in
                        Button {
                            toggle(item.id)
                        } label: {
                            HStack(spacing: 16) {
                                Image(systemName: checkedItems.contains(item.id)
                                      ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(checkedItems.contains(item.id) ? .green : .secondary)
                                    .font(.title3)

                                Text(item.id)
                                    .foregroundColor(.primary)

                                Spacer()

                                Button {
                                    selectedInfoItem = IdentifiableString(id: item.id)
                                } label: {
                                    Image(systemName: "info.circle")
                                        .font(.callout)
                                        .foregroundColor(.secondary)
                                        .padding(8)
                                }
                                .buttonStyle(.borderless)
                            }
                            .contentShape(Rectangle())
                            .padding(.vertical, 6)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Checklist")

            if showConfetti {
                ConfettiView()
                    .ignoresSafeArea()
                    .allowsHitTesting(false)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation { showConfetti = false }
                        }
                    }
            }
        }
        .sheet(item: $selectedInfoItem) { selected in
            if let item = items.first(where: { $0.id == selected.id }) {
                NavigationStack {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            Text(item.id)
                                .font(.title2.bold())
                                .padding(.bottom, 4)

                            VStack(alignment: .leading, spacing: 8) {
                                Text("Description").font(.headline)
                                Text(item.description).font(.body)
                            }

                            VStack(alignment: .leading, spacing: 12) {
                                Text("When to use").font(.headline)
                                VStack(alignment: .leading, spacing: 8) {
                                    ForEach(item.usage.components(separatedBy: ". "), id: \.self) { line in
                                        if !line.isEmpty {
                                            HStack(alignment: .top, spacing: 8) {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .font(.caption)
                                                    .foregroundColor(.green)
                                                    .padding(.top, 2)
                                                Text(line)
                                                    .font(.body)
                                                    .fixedSize(horizontal: false, vertical: true)
                                            }
                                        }
                                    }
                                }
                            }
                            Spacer()
                        }
                        .padding()
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                selectedInfoItem = nil
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.title3)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .presentationDetents([.medium, .large])
                }
            }
        }
        .onAppear {
            loadChecklistState()
            Task {
                await notifManager.refreshAuthorizationStatus()

                guard !notifManager.hasRequestedPermission else { return }
                try? await Task.sleep(for: .milliseconds(600))
                await notifManager.requestPermission()
                notifManager.scheduleRemindersIfNeeded(
                    missingItems: missingItems,
                    totalCount  : items.count
                )
            }
        }
    }

    // MARK: - Helpers

    private func toggle(_ itemID: String) {
        let wasCompleted = checkedItems.count == items.count
        Haptic.tap()

        if checkedItems.contains(itemID) {
            checkedItems.remove(itemID)
        } else {
            checkedItems.insert(itemID)
        }

        saveChecklistState()

        if notifManager.isAuthorized {
            notifManager.scheduleRemindersIfNeeded(
                missingItems: missingItems,
                totalCount  : items.count
            )
        }

        let isNowCompleted = checkedItems.count == items.count
        if !wasCompleted && isNowCompleted {
            Haptic.success()
            withAnimation { showConfetti = true }
        }
    }

    private func saveChecklistState() {
        storedItemsData = (try? JSONEncoder().encode(Array(checkedItems))) ?? Data()
    }

    private func loadChecklistState() {
        if let decoded = try? JSONDecoder().decode([String].self, from: storedItemsData) {
            checkedItems = Set(decoded)
        }
    }
}

// MARK: - Preview

struct ChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChecklistView()
        }
    }
}
