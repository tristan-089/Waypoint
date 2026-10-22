import SwiftUI

struct Note: Identifiable {
    let id = UUID()
    let titre: String
    let temps: Int
    let recompense: Int
}

struct ContentView: View {
    var body: some View {
        DashboardView()
    }
}

#Preview {
    ContentView()
}
