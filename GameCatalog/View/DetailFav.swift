//
//  DetailFav.swift
//  GameCatalog
//
//  Created by Mochamad Dandi on 15/09/21.
//

import SwiftUI
import URLImage

struct DetailFav: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: FavGame.entity(), sortDescriptors: []) var favGame: FetchedResults<FavGame>
    @ObservedObject var networking = Networking()
    
    var game: FavGame
    var body: some View {
        ScrollView {
        VStack {
            URLImage(URL(string: game.backgroundImage ?? "")!) { image in
                image
                    .resizable()
                    .frame(height: 220)
        }
            .frame(height: 220)
            HStack{
                VStack{
                    Text("Released")
                Text(game.released ?? "")
                }
                    .padding()
                    Spacer()
                VStack {
                    Text("Ratings")
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(String(game.rating))
                    }
                }
                .padding()
              
            }
            
        }
//        VStack{
//            Text("PC Minimum Required")
//                .font(.largeTitle)
//                .padding()
//            let pcPlatform = game.platforms.first{$0.platform.name=="PC"}
//            Text(pcPlatform?.requirementsEn?.minimum ?? "-")
//        }
        .navigationBarTitle("\(game.name ?? "")", displayMode: .inline)
            .navigationBarItems(trailing:
                Button("Remove") {
                    self.moc.delete(self.game)
                    try? self.moc.save()
            })
        }
    }
    func formatText(word: String) -> String {
         let a = word.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
         let result = a.replacingOccurrences(of: "&[^;]+;", with: "", options: String.CompareOptions.regularExpression, range: nil)
         return result
     }
}
