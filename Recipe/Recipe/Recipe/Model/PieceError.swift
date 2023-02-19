//
//  PieceError.swift
//  Piece
//
//  Created by Hang Le on 9.6.2022.
//

import Foundation
import SwiftUI

enum RecipeError: Error, LocalizedError {
case readError
case decodingError
case encodingError
case saveError
case saveImageError
case readImageError

    var errorDescription: String? {
        switch self {
        case .readError:
            return NSLocalizedString("Could not load Piece.json, please reinstall the app", comment: "")
        case .decodingError:
            return NSLocalizedString("There was a problem loading your list of images, please create a new image", comment: "")
        case .encodingError:
            return NSLocalizedString("Could not save Piece data, please reinstall the app", comment: "")
        case .saveError:
            return NSLocalizedString("Could not save Piece.json, please reinstall the app", comment: "")
        case .saveImageError:
            return NSLocalizedString("Could not save image, please reinstall the app", comment: "")
        case .readImageError:
            return NSLocalizedString("Could not load image, please reinstall the app", comment: "")
        }
    }

    struct ErrorType: Identifiable {
        let id = UUID()
        let error: RecipeError
        var message: String {
            error.localizedDescription
        }
        let button = Button("OK", role: .cancel) {}
    }

}

