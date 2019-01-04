//
//  AnimalLevel2ViewController.swift
//  Learn By Toque
//
//  Created by John Nolan on 11/27/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import Foundation
import UIKit

class AnimalLevel2ViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var button1: AnimalButton!
    @IBOutlet weak var button2: AnimalButton!
    @IBOutlet weak var button3: AnimalButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    //MARK: Properties
    var allHabitats: [[LBTModel.animal]] = [AnimalsLibrary.farmAnimals, AnimalsLibrary.jungleAnimals, AnimalsLibrary.pondAnimals]
    var correctAnimal: LBTModel.animal!
    var correctHabitat: String!
    var menuLauncher = MenuLauncher()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuButton()
        generateNewQuestion()
    }
    
    //MARK: IBActions
    @IBAction func button1Tapped(_ sender: Any) {
        userTapped(button: sender as! AnimalButton)
    }
    @IBAction func button2Tapped(_ sender: Any) {
        userTapped(button: sender as! AnimalButton)
    }
    @IBAction func button3Tapped(_ sender: Any) {
        userTapped(button: sender as! AnimalButton)
    }
    
    func setupMenuButton() {
        let menuButton = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(showMenu))
        navigationItem.rightBarButtonItem = menuButton
    }
    
    @objc func showMenu() {
        menuLauncher.showMenu()
    }
    
    //check each button to find which is correct. set correct button to correctAnimal and set the rest to random animals
    func setButtonAnimals() {
        var allAnimals: [LBTModel.animal] = []
        switch correctHabitat {
        case "farm":
            allAnimals.append(contentsOf: AnimalsLibrary.jungleAnimals)
            allAnimals.append(contentsOf: AnimalsLibrary.pondAnimals)
        case "jungle":
            allAnimals.append(contentsOf: AnimalsLibrary.farmAnimals)
            allAnimals.append(contentsOf: AnimalsLibrary.pondAnimals)
        default:
            allAnimals.append(contentsOf: AnimalsLibrary.farmAnimals)
            allAnimals.append(contentsOf: AnimalsLibrary.jungleAnimals)
        }
        allAnimals.removeAll {$0.name == correctAnimal.name}
        if button1.isCorrect {
            button1.animal = correctAnimal
        } else {
            button1.animal = allAnimals.randomElement()
            allAnimals.removeAll {$0.name == button1.animal.name}
        }
        button1.setTitle(button1.animal.name, for: .normal)
        
        if button2.isCorrect {
            button2.animal = correctAnimal
        } else {
            button2.animal = allAnimals.randomElement()
            allAnimals.removeAll {$0.name == button2.animal.name}
        }
        button2.setTitle(button2.animal.name, for: .normal)
        
        if button3.isCorrect {
            button3.animal = correctAnimal
        } else {
            button3.animal = allAnimals.randomElement()
            allAnimals.removeAll {$0.name == button3.animal.name}
        }
        button3.setTitle(button3.animal.name, for: .normal)
    }
    
    //set a random button as the correct button
    func setButtonAsCorrect() {
        //TODO: pick a button to be the correct choice
        let buttonArray: [AnimalButton] = [button1, button2, button3]
        let correctButton = buttonArray.randomElement()
        correctButton?.isCorrect = true
    }
    
    func setAllButtonsToIncorrect() {
        button1.isCorrect = false
        button2.isCorrect = false
        button3.isCorrect = false
    }
    
    func setCorrectHabitat() {
        let habitat = allHabitats.randomElement()
        correctHabitat = habitat?[0].home
    }
    
    func generateCorrectAnimalFromHabitat() {
        switch correctHabitat {
        case "farm":
            correctAnimal = AnimalsLibrary.farmAnimals.randomElement()
        case "jungle":
            correctAnimal = AnimalsLibrary.jungleAnimals.randomElement()
        default:
            correctAnimal = AnimalsLibrary.pondAnimals.randomElement()
        }
    }
    
    func generateNewQuestion() {
        setCorrectHabitat()
        generateCorrectAnimalFromHabitat()
        setButtonAsCorrect()
        setButtonAnimals()
        questionLabel.text = "Which animal live in the \(correctAnimal.home)?"
    }
    
    func userTapped(button: AnimalButton) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let alertMessage = "Would you like to try another one?"
        var alertTitle: String! = ""
        let tryAnother = UIAlertAction(title: "Yes", style: .default, handler: { action in
            self.generateNewQuestion()
        })
        let mainMenu = UIAlertAction(title: "No", style: .default, handler: { action in
            //TODO: rewind to main menu
            self.dismiss(animated: true, completion: nil)
        })
        if button.isCorrect == true {
            alertTitle = "Great Job!"
            setAllButtonsToIncorrect()
        } else {
            alertTitle = "Oops"
        }
        alert.title = alertTitle
        alert.message = alertMessage
        alert.addAction(tryAnother)
        alert.addAction(mainMenu)
        present(alert, animated: true, completion: nil)
    }
}
