//
//  ColorLevel2ViewController.swift
//  Learn By Toque
//
//  Created by John Nolan on 11/27/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation
import UIKit

class ColorLevel2ViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var button1: ColorsButton!
    @IBOutlet weak var button2: ColorsButton!
    @IBOutlet weak var button3: ColorsButton!
    @IBOutlet weak var button4: ColorsButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    //MARK: Properties
    var correctColor: LBTModel.color?
    var madeOfColors: [String] = []
    var correctButtons: [ColorsButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCorrectColor()
        generateNewQuestion()
    }
    
    //MARK: IBActions
    @IBAction func button1Tapped(_ sender: Any) {
        buttonPressed(button: sender as! ColorsButton)
    }
    
    @IBAction func button2Tapped(_ sender: Any) {
        buttonPressed(button: sender as! ColorsButton)
    }
    
    @IBAction func button3Tapped(_ sender: Any) {
        buttonPressed(button: sender as! ColorsButton)
    }
    
    @IBAction func button4Tapped(_ sender: Any) {
        buttonPressed(button: sender as! ColorsButton)
    }
    
    
    //select two random button of the three to be the "correct" selection
    func setButtonsAsCorrect() {
        var buttonArray = [button1, button2, button3, button4] as! [ColorsButton]
        correctButtons.append(buttonArray.randomElement()!)
        buttonArray.removeAll {$0 == correctButtons[0]}
        correctButtons.append(buttonArray.randomElement()!)
    }
    
    //picks a random color from an array of all colors in the app and sets the question label accordingly
    func setCorrectColor() {
        correctColor = ColorsLibrary.secondaryColors.randomElement()!
        let color = correctColor?.color
        madeOfColors.append((correctColor?.madeOf[0])!)
        madeOfColors.append((correctColor?.madeOf[1])!)
        questionLabel.text = "Which color is \(color!)?"
    }
    
    //checks each button to see if it is the "correct" button. then randomly sets a color to that button if its not the "correct" one
    func setButtonColors() {
        var colors = pullColorsFromArray(colorObjects: ColorsLibrary.allColors)
        if correctButtons.contains(button1) {
            button1.isCorrectButton = true
            button1.color = madeOfColors.randomElement()
            colors.removeAll {$0 == button1.color}
            button1.setTitle(button1.color, for: .normal)
        } else {
            button1.isCorrectButton = false
            button1.color = colors.randomElement()!
            colors.removeAll {$0 == button1.color}
            button1.setTitle(button1.color, for: .normal)
        }
        
        if correctButtons.contains(button2) {
            button2.isCorrectButton = true
            button2.color = correctColor?.color
            colors.removeAll {$0 == button2.color}
            button2.setTitle(button2.color, for: .normal)
        } else {
            button2.isCorrectButton = false
            button2.color = colors.randomElement()!
            colors.removeAll {$0 == button2.color}
            button2.setTitle(button2.color, for: .normal)
        }
        
        if correctButtons.contains(button3) {
            button3.isCorrectButton = true
            button3.color = correctColor?.color
            colors.removeAll {$0 == button3.color}
            button3.setTitle(button3.color, for: .normal)
        } else {
            button3.isCorrectButton = false
            button3.color = colors.randomElement()!
            colors.removeAll {$0 == button3.color}
            button3.setTitle(button3.color, for: .normal)
        }
        
        if correctButtons.contains(button4) {
            button4.isCorrectButton = true
            button4.color = correctColor?.color
            colors.removeAll {$0 == button4.color}
            button4.setTitle(button4.color, for: .normal)
        } else {
            button4.isCorrectButton = false
            button4.color = colors.randomElement()!
            colors.removeAll {$0 == button4.color}
            button4.setTitle(button4.color, for: .normal)
        }
    }
    
    func pullColorsFromArray(colorObjects: [LBTModel.color]) -> [String] {
        var colors: [String] = []
        for object in colorObjects {
            colors.append(object.color)
        }
        return colors
    }
    
    func generateNewQuestion() {
        setButtonsAsCorrect()
        setCorrectColor()
        setButtonColors()
    }
    
    func buttonPressed(button: ColorsButton){
        var alertTitle: String!
        var alertMessage: String!
        if button.isCorrectButton! {
            alertTitle = "Great job!"
            alertMessage = "Would you like to try another?"
        } else {
            alertTitle = "Close!"
            alertMessage = "Would you like to try another?"
        }
        let tryAgain = UIAlertAction(title: "Try Another", style: .default, handler: { action in
            self.generateNewQuestion()
        })
        let backToMainMenu = UIAlertAction(title: "No thanks", style: .default, handler: { action in
            //TODO: call rewind to main menu
            self.dismiss(animated: true, completion: nil)
        })
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .actionSheet)
        alert.addAction(tryAgain)
        alert.addAction(backToMainMenu)
        present(alert, animated: true, completion: nil)
    }
    
}
