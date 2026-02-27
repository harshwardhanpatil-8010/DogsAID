import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenDisclaimer") private var hasSeenDisclaimer = false
    @State private var showDisclaimerSheet = false

    var body: some View {
        RootTabView()
            .task {
                try? await Task.sleep(nanoseconds: 1_600_000_000)
                if !hasSeenDisclaimer {
                    showDisclaimerSheet = true
                }
            }
            .sheet(isPresented: $showDisclaimerSheet) {
                DisclaimerView {
                    showDisclaimerSheet = false
                    hasSeenDisclaimer = true
                }
                .interactiveDismissDisabled(true)
                .presentationDetents([.large])
                .presentationDragIndicator(.hidden)
            }
    }
}
