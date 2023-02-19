//
//  CardRow.swift
//  Piece
//
//  Created by Hang Le on 4.8.2022.
//

import SwiftUI

struct HeaderRow: View {

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 12) {
                HeaderItem(cardTitleName: "Pasta Maailmaa",
                           recipeTitle: "Valio",
                           recipeSite: "",
                           imageName: "creamy-roasted-red-pepper-pasta-1",
                           urlString: "https://www.valio.fi/arkiruoka/pasta/")
                    .padding(.leading, 15)
                HeaderItem(cardTitleName: "Nopea Lounas",
                           recipeTitle: "Meilla Kotona",
                           recipeSite: "",
                           imageName: "shake-shack-bowl-pics",
                           urlString: "https://www.meillakotona.fi/artikkelit/nopeat-lounasideat")
                HeaderItem(cardTitleName: "Everything Smoothie",
                           recipeTitle: "Kristine's Kitchen",
                           recipeSite: "",
                           imageName: "strawberry-banana-smoothie",
                           urlString: "https://kristineskitchenblog.com/smoothie-recipes/")
            }
        } // ScrollView
        .frame(height: 375)
    }
}

struct CardRow_Previews: PreviewProvider {
    static var previews: some View {
        HeaderRow()
    }
}
