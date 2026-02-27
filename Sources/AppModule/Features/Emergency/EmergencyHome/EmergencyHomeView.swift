import SwiftUI

struct EmergencyHomeView: View {

    @State private var searchText = ""
    @State private var intentRoute: EmergencyRoute?
    @State private var showInfoSheet = false

    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    private var searchResults: [EmergencyTopicModel] {
        guard !searchText.isEmpty else { return [] }
        return EmergencyTopicCatalog.allTopics.filter {
            $0.title.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        List {
            heroImageSection
            contentSection
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Emergencies")
        .navigationBarTitleDisplayMode(horizontalSizeClass == .regular ? .inline : .large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showInfoSheet = true
                } label: {
                    Image(systemName: "info.circle")
                }
                .accessibilityLabel("App information")
            }
        }
        .searchable(
            text: $searchText,
            prompt: "What’s happening?"
        )
        .scrollDismissesKeyboard(.interactively)
        .sheet(isPresented: $showInfoSheet) {
            NavigationStack {
                InfoView()
            }
            .presentationDetents([.large])
            .presentationDragIndicator(.hidden)
        }
        .onChange(of: searchText) { _, newValue in
            handleSearchChange(newValue)
        }
        .navigationDestination(for: EmergencyRoute.self) { route in
            EmergencyRouter.destination(for: route)
        }
        .navigationDestination(isPresented: Binding(
            get: { intentRoute != nil },
            set: { if !$0 { intentRoute = nil } }
        )) {
            if let route = intentRoute {
                EmergencyRouter.destination(for: route)
            }
        }
    }

    @ViewBuilder
    private var heroImageSection: some View {
        if searchText.isEmpty {
            Section {
                Image("HomeScreenDog")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 220)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
            }
        }
    }

    @ViewBuilder
    private var contentSection: some View {
        if searchText.isEmpty {
            catalogSections
        } else if searchResults.isEmpty {
            emptySearchSection
        } else {
            Section {
                ForEach(searchResults) { TopicListRow(topic: $0) }
            }
        }
    }

    @ViewBuilder
    private var catalogSections: some View {
        ForEach(EmergencyTopicCatalog.sections) { section in
            Section(header: sectionHeader(section.title)) {
                ForEach(section.topics) { TopicListRow(topic: $0) }
            }
        }
    }

    private var emptySearchSection: some View {
        Section {
            VStack(spacing: 12) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 40, weight: .light))
                    .foregroundStyle(.tertiary)

                Text("Not sure what’s wrong?")
                    .font(.system(size: 20, weight: .semibold))

                Text("Try typing what you see.\nExample: collapsed, breathing trouble, bleeding.")
                    .font(.system(size: 14))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 40)
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        }
    }

    private func handleSearchChange(_ newValue: String) {
        guard let intent = EmergencyIntentResolver.resolve(from: newValue) else { return }
        intentRoute = EmergencyIntentResolver.route(for: intent)
        searchText = ""
    }

    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.system(size: 22, weight: .bold))
            .foregroundStyle(.primary)
            .textCase(nil)
            .padding(.top, 8)
    }
}

struct TopicListRow: View {
    let topic: EmergencyTopicModel

    var body: some View {
        NavigationLink(value: topic.route) {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(topic.iconColor)
                        .frame(width: 32, height: 32)
                    Image(systemName: topic.icon)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.white)
                }
                Text(topic.title)
                    .font(.system(size: 17))
                    .foregroundStyle(.primary)
            }
            .padding(.vertical, 2)
        }
    }
}

#Preview {
    NavigationStack {
        EmergencyHomeView()
    }
}
