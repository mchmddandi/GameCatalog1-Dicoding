//
//  FavouriteView.swift
//  GameCatalog
//
//  Created by Mochamad Dandi on 15/09/21.
//

import SwiftUI
import URLImage

struct FavouriteView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: FavGame.entity(), sortDescriptors: []) var favGame: FetchedResults<FavGame>

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(favGame, id: \.id) { game in
                        NavigationLink(destination: DetailFav(game: game)) {
                            ListFav(game: game)
                        }
                    }
                    .onDelete(perform: delete)
                }
                .navigationBarTitle("Favourite", displayMode: .inline)
                .navigationBarItems(leading: EditButton())
            }
            .onAppear {
                try? self.moc.save()
            }
        }
    }
    func delete(at offsets: IndexSet) {
        for offset in offsets {
            let game = favGame[offset]
            moc.delete(game)
        }
        try? moc.save()
    }
}
struct ListFav: View {
    var game: FavGame
    var body: some View {
        HStack {
            VStack {
                URLImage(URL(string: game.backgroundImage!)!) { image in
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
            }
                .frame(width: 80, height: 80)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
            }
            
            VStack (alignment: .leading) {
                Text(game.name!)
                HStack {
                    Image(systemName: "star.fill")
                        .imageScale(.small)
                        .foregroundColor(.yellow)
                    Text(String(game.rating))
            }
                    Text (game.released!)
            }
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
