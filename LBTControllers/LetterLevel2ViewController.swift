//
//  LetterLevel2ViewController.swift
//  Learn By Toque
//
//  Created by John Nolan on 11/27/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation
import UIKit

class LetterLevel2ViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var button1: LetterButton!
    @IBOutlet weak var button2: LetterButton!
    @IBOutlet weak var button3: LetterButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    //MARK: Properties
    var alphabetItem: LBTModel.alphabetItem!
    var allButtons: [LetterButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allButtons = [button1, button2, button3]
        setAllButtonsToFalse()
        generateNewQuestion()
    }
    
    //MARK: IBActions
    @IBAction func button1Tapped(_ sender: Any) {
        userTapped(button: sender as! LetterButton)
    }
    
    @IBAction func button2Tapped(_ sender: Any) {
        userTapped(button: sender as! LetterButton)
    }
    
    @IBAction func button3Tapped(_ sender: Any) {
        userTapped(button: sender as! LetterButton)
    }
    
    
    func setButtonLetters() {
        var allLetters = LettersLibrary.allLetters
        for letter in alphabetItem.containsLetters {
            allLetters.removeAll {$0.character == letter.character}
        }
        let correctLetter = alphabetItem.containsLetters.randomElement()
        if button1.isCorrect! {
            button1.letter = correctLetter
            button1.setTitle(button1.letter.character, for: .normal)
        } else {
            button1.letter = allLetters.randomElement()
            allLetters.removeAll {$0.character == button1.letter.character}
            button1.setTitle(button1.letter.character, for: .normal)
        }
        
        if button2.isCorrect! {
            button2.letter = correctLetter
            button2.setTitle(button2.letter.character, for: .normal)
        } else {
            button2.letter = allLetters.randomElement()
            allLetters.removeAll {$0.character == button2.letter.character}
            button2.setTitle(button2.letter.character, for: .normal)
        }
        
        if button3.isCorrect! {
            button3.letter = correctLetter
            button3.setTitle(button3.letter.character, for: .normal)
        } else {
            button3.letter = allLetters.randomElement()
            allLetters.removeAll {$0.character == button3.letter.character}
            button3.setTitle(button3.letter.character, for: .normal)
        }
    }
    
    func generateNewQuestion() {
        alphabetItem = LettersLibrary.allAlphabetItems.randomElement()
        questionLabel.text = "\(alphabetItem.name) contains which letter?"
        setCorrect(buttons: allButtons)
        setButtonLetters()
    }
    
    func userTapped(button: LetterButton) {
        let alert = UIAlertController(title: "", message: "Would you like to try again?", preferredStyle: .alert)
        let tryAgain = UIAlertAction(title: "Yes", style: .default, handler: { action in
            self.setAllButtonsToFalse()
            self.generateNewQuestion()
        })
        let mainMenu = UIAlertAction(title: "No", style: .default, handler: { action in
            //TODO: rewind to main menu
            self.dismiss(animated: true, completion: nil)
        })
        alert.addAction(tryAgain)
        alert.addAction(mainMenu)
        var alertTitle: String = ""
        if button.isCorrect! {
            alertTitle = "Great Job!"
        } else {
            alertTitle = "Oops"
        }
        alert.title = alertTitle
        present(alert, animated: true, completion: nil)
    }
    
    func setCorrect(buttons: [LetterButton]) {
        let correctButton = buttons.randomElement()
        correctButton?.isCorrect = true
    }
    
    func setAllButtonsToFalse() {
        button1.isCorrect = false
        button2.isCorrect = false
        button3.isCorrect = false
    }
}
