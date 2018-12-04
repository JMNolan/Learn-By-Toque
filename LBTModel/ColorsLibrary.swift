//
//  ColorsLibrary.swift
//  Learn By Toque
//
//  Created by John Nolan on 11/29/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation

let red = LBTModel.color(color: "Red", madeOf: ["Red"])
let blue =  LBTModel.color(color: "Blue", madeOf: ["Blue"])
let yellow = LBTModel.color(color: "Yellow", madeOf: ["Yellow"])

let orange = LBTModel.color(color: "Orange", madeOf: ["Red", "Yellow"])
let green = LBTModel.color(color: "Green", madeOf: ["Blue", "Yellow"])
let purple = LBTModel.color(color: "Purple", madeOf: ["Blue", "Red"])

class ColorsLibrary {
    
    static let allColors: [LBTModel.color] = [
        red,
        blue,
        yellow,
        orange,
        green,
        purple
    ]
    
    static let secondaryColors: [LBTModel.color] = [
        orange,
        green,
        purple
    ]
    
}
