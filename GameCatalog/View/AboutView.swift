//
//  AboutView.swift
//  GameCatalog
//
//  Created by Mochamad Dandi on 02/09/21.
//

import SwiftUI

struct AboutView: View {
    var gradient: [Color] = [Color("Color01"),Color("Color02")]
    var body: some View {
        ZStack{
            Image("foto_TA")
            VStack {
                Text("Mocahamad Dandi")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Text("iOS Fundamental Dicoding")
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .italic()
            }
            .offset(y: -218)
        }
        .frame(width: 335, height: 545)
        .background(LinearGradient(gradient:Gradient(colors: gradient), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
