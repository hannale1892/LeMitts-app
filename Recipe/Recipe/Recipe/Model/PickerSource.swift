//
//  Picker.swift
//  Piece
//
//  Created by Hang Le on 8.6.2022.
//

import UIKit

enum PickerSource {
    enum Source {
        case library, camera
    }
    
    enum PickerError: Error, LocalizedError {
        case unavailable
    }
    
    static func checkPermissions() -> Bool {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            return true
        } else {
            return false
        }
    }
}
