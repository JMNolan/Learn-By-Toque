//
//  ColorLevel1ViewController.swift
//  Learn By Toque
//
//  Created by John Nolan on 11/27/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation
import UIKit

class ColorLevel1ViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var button1: ColorsButton!
    @IBOutlet weak var button2: ColorsButton!
    @IBOutlet weak var button3: ColorsButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    //MARK: Properties
    var correctColor: LBTModel.color?
    var correctButton: ColorsButton!
    var menuLauncher = MenuLauncher()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuButton()
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
    
    func setupMenuButton() {
        let menuButton = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(showMenu))
        navigationItem.rightBarButtonItem = menuButton
    }
    
    @objc func showMenu() {
        menuLauncher.showMenu()
    }
    
    //select random button of the three to be the "correct" selection
    func setButtonAsCorrect() {
        let buttonArray = [button1, button2, button3]
        correctButton = buttonArray.randomElement()!
    }
    
    //picks a random color from an array of all colors in the app and sets the question label accordingly
    func setCorrectColor() {
        correctColor = ColorsLibrary.allColors.randomElement()!
        let color = correctColor?.color
        questionLabel.text = "Which color is \(color!)?"
    }
    
    //checks each button to see if it is the "correct" button. then randomly sets a color to that button if its not the "correct" one
    func setButtonColors() {
        var colors = pullColorsFromArray(colorObjects: ColorsLibrary.allColors)
        colors.removeAll {$0 == correctColor?.color}
        if button1 == correctButton {
            button1.isCorrectButton = true
            button1.color = correctColor?.color
            colors.removeAll {$0 == button1.color}
            button1.setTitle(button1.color, for: .normal)
        } else {
            button1.isCorrectButton = false
            button1.color = colors.randomElement()!
            colors.removeAll {$0 == button1.color}
            button1.setTitle(button1.color, for: .normal)
        }
        
        if button2 == correctButton {
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
        
        if button3 == correctButton {
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
    }
    
    func pullColorsFromArray(colorObjects: [LBTModel.color]) -> [String] {
        var colors: [String] = []
        for object in colorObjects {
            colors.append(object.color)
        }
        return colors
    }
    
    func generateNewQuestion() {
        setButtonAsCorrect()
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
