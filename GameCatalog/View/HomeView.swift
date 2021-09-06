//
//  HomeView.swift
//  GameCatalog
//
//  Created by Mochamad Dandi on 02/09/21.
//

import SwiftUI
import URLImage

struct HomeView: View {
    @ObservedObject var api = Networking()
    var body: some View {

        List(api.games) { game in
            NavigationLink(
                destination: Detail(game: game)){
                    Item(game: game)
                    
                }
        }
        .navigationBarTitle("Games")
            .onAppear() {
                api.getData()
            }
    }
}

struct Item: View {
    var game: Game
    var body: some View {
        HStack {
            VStack {
                URLImage(URL(string: game.backgroundImage)!) { image in
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
                    Text (game.released)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
