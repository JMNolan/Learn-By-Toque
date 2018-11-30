//
//  ColorsLibrary.swift
//  Learn By Toque
//
//  Created by John Nolan on 11/29/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation

let red = LBTModel.primaryColor(color: "Red")
let blue =  LBTModel.primaryColor(color: "Blue")
let yellow = LBTModel.primaryColor(color: "Yellow")

let orange = LBTModel.secondaryColor(colors: ["Red", "Yellow"])
let green = LBTModel.secondaryColor(colors: ["Blue", "Yellow"])
let purple = LBTModel.secondaryColor(colors: ["Blue", "Red"])

class ColorsLibrary {
    
    let allColors: [Any] = [
        red,
        blue,
        yellow,
        orange,
        green,
        purple
    ]
    
    let secondaryColors: [LBTModel.secondaryColor] = [
        orange,
        green,
        purple
    ]
    
}
