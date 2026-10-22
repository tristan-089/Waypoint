import SwiftUI
import Foundation

struct QuestsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let colonnes = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        ZStack {
            AppColors.background.ignoresSafeArea()
            
            ScrollView(.vertical) {
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Button {
                        dismiss()
                    }label: {
                        Label("Voir Tout", systemImage: "arrow.backward")
                            .font(.headline)
                            .bold()
                            .foregroundColor(AppColors.mint)
                            .padding()
                    }
                    
                    
                    LazyVGrid(columns: colonnes ,spacing: 16) {
                        ForEach(DashboardView.note) { note in
                            QueteCardView(note: note)
                            
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    QuestsView()
}
