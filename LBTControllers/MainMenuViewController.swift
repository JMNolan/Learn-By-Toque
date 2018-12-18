//
//  ViewController.swift
//  Learn By Toque
//
//  Created by John Nolan on 11/27/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var colorsButton: UIButton!
    @IBOutlet weak var animalsButton: UIButton!
    @IBOutlet weak var lettersButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    //Mark: Properties
    let menuLauncher = MenuLauncher()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuButton()
        
    }

    //MARK: IBActions
    @IBAction func colorsButtonTapped(_ sender: Any) {
        presentLevelOptionsAlert(segueString1: "MainMenuToColors1", segueString2: "MainMenuToColors2")
    }
    
    @IBAction func animalsButtonTapped(_ sender: Any) {
        presentLevelOptionsAlert(segueString1: "MainMenuToAnimals1", segueString2: "MainMenuToAnimals2")
    }
    
    @IBAction func lettersButtonTapped(_ sender: Any) {
        presentLevelOptionsAlert(segueString1: "MainMenuToLetters1", segueString2: "MainMenuToLetters2")
    }
    
    @IBAction func settingsButtonTapped(_ sender: Any) {
        //TODO:  reate popover menu for settings
    }
    
    fileprivate func presentLevelOptionsAlert(segueString1: String, segueString2: String) {
        let alert = UIAlertController(title: "Choose A Level", message: "What level would you like to try?", preferredStyle: .actionSheet)
        let level1Action = UIAlertAction(title: "Level 1", style: .default, handler: { action in
            self.performSegue(withIdentifier: segueString1, sender: self)
        })
        let level2Action = UIAlertAction(title: "Level 2", style: .default, handler: { action in
            self.performSegue(withIdentifier: segueString2, sender: self)
        })
        alert.addAction(level1Action)
        alert.addAction(level2Action)
        present(alert, animated: true, completion: nil)
    }
    
    func setupMenuButton() {
        let menuButton = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(showMenu))
        navigationItem.rightBarButtonItem = menuButton
    }
    
    @objc func showMenu() {
        //TODO: present menu and dim background
        menuLauncher.showMenu()
    }

}

