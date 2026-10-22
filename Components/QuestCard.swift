import SwiftUI
import Foundation

struct QueteCardView: View {
    
    let note: Note
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(note.titre)
                .font(.headline)
                .padding()
                .foregroundStyle(.white)
                .bold()
            
            HStack {
                
                Text("\(note.temps)mn")
                    .font(.headline)
                    .padding()
                    .foregroundStyle(.gray)
                    
                                    
                Text("\(note.recompense)XP")
                    .font(.headline)
                    .padding()
                    .foregroundStyle(.gray)
                    
            }.scrollIndicators(.hidden)

        }.background(AppColors.card)
         .clipShape(RoundedRectangle(cornerRadius: 14))
         .padding(.horizontal)
    
    }
}
