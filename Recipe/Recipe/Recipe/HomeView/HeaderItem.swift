//
//  CardView.swift
//  Piece
//
//  Created by Hang Le on 3.8.2022.
//

import SwiftUI

struct HeaderItem: View {
    var cardTitleName: String
    var recipeTitle: String
    var recipeSite: String
    var imageName: String
    var urlString: String
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(cardTitleName)
                .font(.title2)
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 325, height: 325)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .overlay {
                    ZStack(alignment: .bottomLeading) {
                        gradient
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(recipeTitle)
                                    .font(.title3)
                                    .fontWeight(.semibold)
//                                Text(recipeSite)
//                                    .font(.callout)
                            }
                            Spacer()
                            Link(destination: URL(string: urlString)!) {
                                Text("Lue")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 7)
                                    .background(Color.black.opacity(0.6))
                                    .clipShape(Capsule())
                            }
//                            Button(action: {
//                                print("Try tapped!")
//                            }) {
//                                Text("VIEW")
//                                    .font(.callout)
//                                    .fontWeight(.semibold)
//                            }
//                            .padding(.horizontal, 15)
//                            .padding(.vertical, 5)
//                            .background(Color.white.opacity(0.4))
//                            .clipShape(Capsule())
                        }
                        .padding()
                    } // ZStack
                    .foregroundColor(.white)
                }
                .cornerRadius(5)
        } //VStack
        .padding(.top, 5)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderItem(cardTitleName: "Source of Pasta",
                   recipeTitle: "Salt & Lavender",
                   recipeSite: "saltandlavender.com",
                   imageName: "creamy-roasted-red-pepper-pasta-1",
                   urlString: "https://www.saltandlavender.com/creamy-roasted-red-pepper-pasta/")
    }
}
