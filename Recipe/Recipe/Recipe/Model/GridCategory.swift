//
//  GridCategory.swift
//  Piece
//
//  Created by Hang Le on 1.8.2022.
//

import Foundation

enum GridCategory: String, CaseIterable, Identifiable {
    var id: String {
        rawValue
    }
    
    case recentlyAdded = "Recently Added"
    case favorite = "Favorite"
    case trendingNow = "Trending Now "
}
