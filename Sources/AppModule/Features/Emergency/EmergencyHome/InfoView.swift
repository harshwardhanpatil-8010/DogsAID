import SwiftUI

struct InfoView: View {

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        List {

            purposeSection
            helpSection
            usageSection
            designSection
            legalSection
        }
        .listStyle(.insetGrouped)
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
                .accessibilityLabel("Close")
            }
        }
    }
    private var usageSection: some View {
        Section("How to use") {
            VStack(alignment: .leading, spacing: 6) {
                Text("Navigation")
                    .font(.callout.weight(.semibold))

                Text("Swipe left or right to move between emergency steps.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            .padding(.vertical, 4)
        }
    }
    private var purposeSection: some View {
        Section("Purpose") {
            InfoRow(
                title: "Step-by-step first aid guidance",
                message: "Helps you respond quickly during dog emergencies. Works offline. " +
                "Designed for high-stress situations. Always contact a veterinarian for professional care."
            )
        }
    }

    private var helpSection: some View {
        Section("When to seek help") {
            InfoRow(
                title: "Contact a veterinarian immediately if",
                message: "Your dog is unresponsive, seriously injured, breathing abnormally, " +
                "or if you are unsure what to do."
            )
        }
    }

    private var designSection: some View {
        Section("Design") {
            InfoRow(
                title: "Built for emergencies",
                message: "Minimal, distraction-free interface optimized for clarity during stressful moments."
            )
        }
    }

    private var legalSection: some View {
        Section {
            Text("DogsAID provides general first aid information only and is not a substitute for " +
                 "professional veterinary advice, diagnosis, or treatment.")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
        }
    }
}

private struct InfoRow: View {
    let title: String
    let message: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.callout.weight(.semibold))
            Text(message)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 4)
    }
}
