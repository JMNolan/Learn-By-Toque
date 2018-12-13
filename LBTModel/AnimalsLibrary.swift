//
//  AnimalsLibrary.swift
//  Learn By Toque
//
//  Created by John Nolan on 11/29/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation

let pig = LBTModel.animal(name: "pig", sound: "oink", home: "farm")
let cow = LBTModel.animal(name: "cow", sound: "moo", home: "farm")
let chicken = LBTModel.animal(name: "chicken", sound: "cluck", home: "farm")
let sheep = LBTModel.animal(name: "sheep", sound: "baaa", home: "farm")

let monkey = LBTModel.animal(name: "monkey", sound: "ooh ooh aah aah", home: "jungle")
let lion = LBTModel.animal(name: "lion", sound: "roar", home: "jungle")
let parrot = LBTModel.animal(name: "parrot", sound: "kaw", home: "jungle")
let zebra = LBTModel.animal(name: "zebra", sound: "whinny", home: "jungle")

let fish = LBTModel.animal(name: "fish", sound: "burble burble", home: "pond")
let frog = LBTModel.animal(name: "frog", sound: "ribbit", home: "pond")
let duck = LBTModel.animal(name: "duck", sound: "quack", home: "pond")
let goose = LBTModel.animal(name: "goose", sound: "honk", home: "pond")

class AnimalsLibrary {
    
    static let allAnimals: [LBTModel.animal] = [
        pig,
        cow,
        chicken,
        sheep,
        monkey,
        lion,
        parrot,
        zebra,
        fish,
        frog,
        duck,
        goose
    ]
    
    static let farmAnimals: [LBTModel.animal] = [
        pig,
        cow,
        chicken,
        sheep
    ]
    
    static let jungleAnimals: [LBTModel.animal] = [
        monkey,
        lion,
        parrot,
        zebra
    ]
    
    static let pondAnimals: [LBTModel.animal] = [
        fish,
        frog,
        duck,
        goose
    ]
}
