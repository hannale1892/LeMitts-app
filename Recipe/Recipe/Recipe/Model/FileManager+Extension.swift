//
//  FileManager+Extension.swift
//  Piece
//
//  Created by Hang Le on 9.6.2022.
//

import UIKit
import SwiftUI

let fileName = "LeMitts.json"

extension FileManager {
    static var docDirURL: URL {
    return Self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func docExist(named docName: String) -> Bool {
        fileExists(atPath: Self.docDirURL.appendingPathComponent(docName).path)
    }
    
    
    func saveImage(id: String, image: UIImage) throws {
        if let data = image.jpegData(compressionQuality: 0.8) {
            let imageURL = FileManager.docDirURL.appendingPathComponent("\(id).jpg")
            do {
                try data.write(to: imageURL)
            } catch {
                throw RecipeError.saveImageError
            }
        } else {
            throw RecipeError.saveImageError
        }
    }
    
    func readImage(with id: UUID) throws -> UIImage {
        let imageURL = FileManager.docDirURL.appendingPathComponent("\(id).jpg")
        do {
            let imageData = try Data(contentsOf: imageURL)
            if let image = UIImage(data: imageData) {
                return image
            } else {
                throw RecipeError.readImageError
            }
        } catch {
            throw RecipeError.readImageError
        }
    }
    
}
