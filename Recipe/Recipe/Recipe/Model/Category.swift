//
//  Category.swift
//  Piece
//
//  Created by Hang Le on 27.7.2022.
//

import Foundation

enum Category: String, CaseIterable, Identifiable, Codable {
    
    case breakfast = "Aamupalat"
    case appetizer = "Alkuruoat"
    case mainCourse = "Pääruoat"
    case sideDish = "Lisukkeet"
    case soup = "Keitot"

    case bakedGoods = "Leivonnaiset"
    case dessert = "Jälkiruoat"
    case holiday = "Juhlaruoat"
    case meatless = "Kasvisruoat‎"
    case drink = "Juomat"
    case unknown = "Tuntematon"


    var name: String {
        rawValue
    }
    var id: String {
        name
    }
}



 
