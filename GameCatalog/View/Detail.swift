//
//  Detail.swift
//  GameCatalog
//
//  Created by Mochamad Dandi on 02/09/21.
//

import SwiftUI
import URLImage

struct Detail: View {
    var description: Requirements?
    var game: Game
    
    var body: some View {
        VStack {
            URLImage(URL(string: game.backgroundImage)!) { image in
                image
                    .resizable()
                    .frame(height: 220)
        }
            .frame(height: 220)
            HStack{
                VStack{
                    Text("Released")
                Text(game.released)
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
        VStack{
            Text("PC Minimum Required")
                .font(.largeTitle)
                .padding()
            let pcPlatform = game.platforms.first{$0.platform.name=="PC"}
            Text(pcPlatform?.requirementsEn?.minimum ?? "-")
        }
        .navigationBarTitle("\(game.name)", displayMode: .inline)
    }
    
}

