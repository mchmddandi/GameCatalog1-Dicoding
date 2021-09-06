//
//  SearchView.swift
//  GameCatalog
//
//  Created by Mochamad Dandi on 02/09/21.
//

import SwiftUI
import URLImage

struct SearchView: View {
    @ObservedObject var api = Networking()
    @State var text = ""
    var body: some View {
        VStack {
            TextField("search game title", text: $text, onCommit: {
                        api.getSearchData(text: text)}
                )
                .padding(7)
                .background(Color(.systemGray))
                .cornerRadius(10)
                .padding()
            List(api.searchedGames) { game in
                ItemSearch(game: game)
            }
        }
    }
}

struct ItemSearch: View {
    var game: SearchedGame
    var body: some View {
        HStack {
            VStack {
                URLImage(URL(string: game.backgroundImage ?? "") ?? URL(string: "https://lh3.googleusercontent.com/a-/AOh14GhECBx-LTrC1olYv2_974kRAwRNCOwYcNvro5QCcg=s192-c-rg-br100")!) { image in
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
            }
                .frame(width: 80, height: 80)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
            }
            
            VStack (alignment: .leading) {
                Text(game.name)
                HStack {
                    Image(systemName: "star.fill")
                        .imageScale(.small)
                        .foregroundColor(.yellow)
                    Text(String(game.rating))
            }
                    Text (game.released ?? "")
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
