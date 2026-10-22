import SwiftUI
import Foundation


struct DashboardView: View {
    @State private var niveau = 1
    @State private var rang = "Explorateur"
    @State private var xp_dans_niveau = 10
    
    @State private var afficherToutLesDefis = false
    
    @State static var note: [Note] = [
        Note(titre: "Apprendre le Swift", temps: 20, recompense: 50),
        Note(titre: "Apprendre le TypeScript", temps: 20, recompense: 50),
        Note(titre: "Apprendre le Java", temps: 20, recompense: 50),
        Note(titre: "Apprendre le Python", temps: 20, recompense: 50),
        Note(titre: "Apprendre le C++", temps: 20, recompense: 50)
    ]
    
    let xp_max_Explorateur = 250
    
    let colonnes = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            AppColors.background.ignoresSafeArea()
            
            ScrollView(.vertical) {
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    VStack (alignment: .leading, spacing: 12) {
                        
                        let date = Date()
                        let calendar = Calendar.current
                        let day = calendar.component((.day), from: date)
                        let month = calendar.component(.month, from: date)
                        let weekDay = calendar.component(.weekday, from: date)
                        
                        var weekdayName: String {
                            Date().formatted(.dateTime.weekday(.wide))
                        }
                        
                        var monthName: String {
                            Date().formatted(.dateTime.month(.wide))
                        }
                        
                        VStack (alignment: .leading, spacing: 4) {
                            
                            HStack {
                                
                                Spacer()
                                
                                Button {
                                    //
                                }label: {
                                    Image(systemName: "person.crop.circle")
                                }.padding()
                                    .font(.system(size: 60))
                                    .foregroundStyle(AppColors.mint)
                            }
                            
                            HStack (spacing: 6){
                                
                                Text("\(weekdayName.uppercased()) \(day) \(monthName.uppercased())")
                                    .font(.system(size: 15)).bold()
                                    .foregroundStyle(.gray)
                                    .font(.caption)
                                
                            }.padding(.leading)
                                .padding(.bottom)
                                .frame(width: .infinity, alignment: .leading)
                                .font(.subheadline)
                            
                            HStack {
                                
                                Text("Waypoint")
                                    .foregroundStyle(.white)
                                    .font(.title.bold())
                                    .padding(.leading)
                                
                            }
                            
                            
                            VStack {
                                
                                Text("Prêt à avancer aujourd'hui ?")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 14))
                                
                            }.padding(.leading)
                            
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            
                            HStack {
                                Text("NIVEAU \(niveau)")
                                    .font(.system(size: 18)).bold()
                                    .foregroundStyle(.gray)
                                    .font(.caption)
                                    .padding()
                                    .padding(.bottom, -32)
                                
                            }
                            
                            HStack {
                                Text("\(rang)")
                                    .foregroundStyle(AppColors.steelBlue)
                                    .font(.title.bold())
                                    .padding()
                                
                                Spacer()
                                
                                Image(systemName: "shield")
                                    .font(.system(size: 30))
                                    .foregroundStyle(.yellow)
                                    .padding()
                                
                            }
                            
                            VStack {
                                
                                HStack {
                                    Text("\(xp_dans_niveau) XP")
                                        .foregroundStyle(AppColors.mint)
                                        .font(.title3).bold()
                                        .padding()
                                    
                                    Spacer()
                                    
                                    Text("\(xp_max_Explorateur) XP")
                                        .foregroundStyle(.gray)
                                        .font(.title3).bold()
                                        .padding()
                                }
                            }
                            
                            HStack(spacing: 12) {
                                
                                ProgressView(value: Double(xp_dans_niveau), total:Double(xp_max_Explorateur))
                                    .tint(AppColors.mint)
                                    .scaleEffect(x: 1, y: 2, anchor: .center)
                                    .padding(.horizontal)
                            }
                            
                            Text("Plus que \(xp_max_Explorateur - xp_dans_niveau) XP")
                                .foregroundStyle(.gray)
                                .font(.system(size: 14))
                                .padding()
                            
                        }.background(AppColors.card)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                            .padding(.horizontal)
                        
                        HStack(spacing: 16) {
                            
                            Text("Quêtes à faire")
                                .foregroundStyle(.white)
                                .font(.title2.bold())
                                .padding(.all)
                            
                            Spacer()
                            
                            Button {
                                afficherToutLesDefis = true
                            }label: {
                                Label("Voir Tout", systemImage: "arrow.right")
                                    .font(.headline)
                                    .bold()
                                    .foregroundColor(AppColors.mint)
                                    .padding()
                            }
                        }
                        
                        .sheet(isPresented: $afficherToutLesDefis) {
                            QuestsView()
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
}
