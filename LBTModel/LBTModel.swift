//
//  LBTModel.swift
//  Learn By Toque
//
//  Created by John Nolan on 11/28/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation
import UIKit


class LBTModel {
    
    struct color {
        let color: String
        let madeOf: [String]
        //let image: UIImage
    }
    
    struct animal {
        let name: String
        let sound: String
        let home: String
//        let image: UIImage
    }
    
    struct letter {
        let character: String
//        let image: UIImage
    }
    
    struct alphabetItem {
        let name: String
        let firstLetter: letter
        let containsLetters: [letter]
//        let image: UIImage
    }
}
