//
//  Networking.swift
//  GameCatalog
//
//  Created by Mochamad Dandi on 02/09/21.
//

import Foundation
import Alamofire

class  Networking: ObservableObject {
    @Published var  games = [Game]()
    @Published var searchedGames = [SearchedGame]()
    
    func getData() {
        AF.request("https://api.rawg.io/api/games?key=aa7bbc66a6364a938243372a5fa013cf")
            .validate()
            .responseDecodable(of: Games.self) { respone in
                guard let data = respone.value else { return }
                self.games = data.results
            }
    }
    
    func getSearchData(text : String) {
        AF.request("https://api.rawg.io/api/games?search=\(text)&key=aa7bbc66a6364a938243372a5fa013cf")
            .validate()
            .responseDecodable(of: SearchedGames.self) { respone in
                guard let data = respone.value else { return }
                self.searchedGames = data.searchedGames
                print(self.searchedGames)
            }

    }
    
    
}
