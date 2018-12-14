//
//  LettersLibrary.swift
//  Learn By Toque
//
//  Created by John Nolan on 11/29/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation

let A = LBTModel.letter(character: "a")
let B = LBTModel.letter(character: "b")
let C = LBTModel.letter(character: "c")
let D = LBTModel.letter(character: "d")
let E = LBTModel.letter(character: "e")
let F = LBTModel.letter(character: "f")
let G = LBTModel.letter(character: "g")
let H = LBTModel.letter(character: "h")
let I = LBTModel.letter(character: "i")
let J = LBTModel.letter(character: "j")
let K = LBTModel.letter(character: "k")
let L = LBTModel.letter(character: "l")
let M = LBTModel.letter(character: "m")
let N = LBTModel.letter(character: "n")
let O = LBTModel.letter(character: "o")
let P = LBTModel.letter(character: "p")
let Q = LBTModel.letter(character: "q")
let R = LBTModel.letter(character: "r")
let S = LBTModel.letter(character: "s")
let T = LBTModel.letter(character: "t")
let U = LBTModel.letter(character: "u")
let V = LBTModel.letter(character: "v")
let W = LBTModel.letter(character: "w")
let X = LBTModel.letter(character: "x")
let Y = LBTModel.letter(character: "y")
let Z = LBTModel.letter(character: "z")

let apple = LBTModel.alphabetItem(name: "apple", firstLetter: A, containsLetters: [A,P,P,L,E])
let ball = LBTModel.alphabetItem(name: "ball", firstLetter: B, containsLetters: [B,A,L,L])
let clock = LBTModel.alphabetItem(name: "clock", firstLetter: C, containsLetters: [C,L,O,C,K])
let deer = LBTModel.alphabetItem(name: "deer", firstLetter: D, containsLetters: [D,E,E,R])
let ear = LBTModel.alphabetItem(name: "ear", firstLetter: E, containsLetters: [E,A,R])
let foot = LBTModel.alphabetItem(name: "foot", firstLetter: F, containsLetters: [F,O,O,T])
let goat = LBTModel.alphabetItem(name: "goat", firstLetter: G, containsLetters: [G,O,A,T])
let hammer = LBTModel.alphabetItem(name: "hammer", firstLetter: H, containsLetters: [H,A,M,M,E,R])
let iron = LBTModel.alphabetItem(name: "iron", firstLetter: I, containsLetters: [I,R,O,N])
let jumpRope = LBTModel.alphabetItem(name: "jump rope", firstLetter: J, containsLetters: [J,U,M,P,R,O,P,E])
let keyboard = LBTModel.alphabetItem(name: "keyboard", firstLetter: K, containsLetters: [K,E,Y,B,O,A,R,D])
let ladybug = LBTModel.alphabetItem(name: "ladybug", firstLetter: L, containsLetters: [L,A,D,Y,B,U,G])
let mailbox = LBTModel.alphabetItem(name: "mailbox", firstLetter: M, containsLetters: [M,A,I,L,B,O,X])
let nose = LBTModel.alphabetItem(name: "nose", firstLetter: N, containsLetters: [N,O,S,E])
let owl = LBTModel.alphabetItem(name: "owl", firstLetter: O, containsLetters: [O,W,L])
let pizza = LBTModel.alphabetItem(name: "pizza", firstLetter: P, containsLetters: [P,I,Z,Z,A])
let queen = LBTModel.alphabetItem(name: "queen", firstLetter: Q, containsLetters: [Q,U,E,E,N])
let ruler = LBTModel.alphabetItem(name: "ruler", firstLetter: R, containsLetters: [R,U,L,E,R])
let spider = LBTModel.alphabetItem(name: "spider", firstLetter: S, containsLetters: [S,P,I,D,E,R])
let tractor = LBTModel.alphabetItem(name: "tractor", firstLetter: T, containsLetters: [T,R,A,C,T,O,R])
let unicorn = LBTModel.alphabetItem(name: "unicorn", firstLetter: U, containsLetters: [U,N,I,C,O,R,N])
let violin = LBTModel.alphabetItem(name: "violin", firstLetter: V, containsLetters: [V,I,O,L,I,N])
let watermelon = LBTModel.alphabetItem(name: "watermelon", firstLetter: W, containsLetters: [W,A,T,E,R,M,E,L,O,N])
let xRay = LBTModel.alphabetItem(name: "x-ray", firstLetter: X, containsLetters: [X,R,A,Y])
let yoYo = LBTModel.alphabetItem(name: "yo-yo", firstLetter: Y, containsLetters: [Y,O,Y,O])
let zipper = LBTModel.alphabetItem(name: "zipper", firstLetter: Z, containsLetters: [Z,I,P,P,E,R])

class LettersLibrary {
    
    static let allLetters: [LBTModel.letter] = [
        A,
        B,
        C,
        D,
        E,
        F,
        G,
        H,
        I,
        J,
        K,
        L,
        M,
        N,
        O,
        P,
        Q,
        R,
        S,
        T,
        U,
        V,
        W,
        X,
        Y,
        Z
    ]
    
    static let allAlphabetItems: [LBTModel.alphabetItem] = [
        apple,
        ball,
        clock,
        deer,
        ear,
        foot,
        goat,
        hammer,
        iron,
        jumpRope,
        keyboard,
        ladybug,
        mailbox,
        nose,
        owl,
        pizza,
        queen,
        ruler,
        spider,
        tractor,
        unicorn,
        violin,
        watermelon,
        xRay,
        yoYo,
        zipper
    ]
}
