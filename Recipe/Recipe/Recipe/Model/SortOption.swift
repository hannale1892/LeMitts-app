//
//  Sorted.swift
//  Piece
//
//  Created by Hang Le on 24.8.2022.
//

import Foundation


enum SortOption: String, CaseIterable, Identifiable {
    case latest = "Latest"
    case name = "Name"
    case fastest = "Fastest"
    
    var name: String {
        rawValue
    }
    
    var id: String {
        name
    }
}
