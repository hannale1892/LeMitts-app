//
//  Color.swift
//  Piece
//
//  Created by Hang Le on 18.7.2022.
//

import SwiftUI

enum Cuisine: String, CaseIterable, Identifiable, Codable, Comparable {
    static func < (lhs: Cuisine, rhs: Cuisine) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    case universal = "Maailmanlaajuinen"

    case european = "Eurooppalainen"
    case asian = "Aasialainen"
    case african = "Afrikkalainen"
    case american = "Amerikkalainen"


    
    var name: String {
        rawValue
    }
    var id: String {
        name
    }
}
