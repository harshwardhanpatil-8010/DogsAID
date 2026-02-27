import SwiftUI

struct RootTabView: View {

    @State private var selectedTab: Int = 0

    var body: some View {
        if #available(iOS 26.0, *) {
            TabView(selection: $selectedTab) {

                Tab("Emergency", systemImage: "cross.case.fill", value: 0) {
                    NavigationStack {
                        EmergencyHomeView()
                    }
                }

                Tab("Checklist", systemImage: "checklist", value: 1) {
                    NavigationStack {
                        ChecklistView()
                            .navigationTitle("Checklist")
                    }
                }
            }
            .tabViewStyle(.sidebarAdaptable)

        } else {
            TabView {
                NavigationStack {
                    EmergencyHomeView()
                }
                .tabItem { Label("Emergency", systemImage: "cross.case.fill") }

                NavigationStack {
                    ChecklistView()
                        .navigationTitle("Checklist")
                }
                .tabItem { Label("Checklist", systemImage: "checklist") }
            }
        }
    }
}
