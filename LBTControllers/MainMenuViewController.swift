//
//  ViewController.swift
//  Learn By Toque
//
//  Created by John Nolan on 11/27/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: IBOutlets
    @IBOutlet weak var colorsButton: UIButton!
    @IBOutlet weak var animalsButton: UIButton!
    @IBOutlet weak var lettersButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    //Mark: Properties
    let menuLauncher = MenuLauncher()
    let menuCollectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    let menuCollectionViewData: [String] = [
        "Progress by month",
        "Progress by week",
        "Lifetime statistics"
    ]
    let dimView = UIView()
    let cellID = "cellID"
    
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
        //TODO:  create popover menu for settings
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
    
    @objc func dismissDimView() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.dimView.alpha = 0
            self.menuCollectionView.frame = CGRect(x: -self.menuCollectionView.frame.width , y: 0, width: self.menuCollectionView.frame.width, height: self.menuCollectionView.frame.height)
        }, completion: nil)
    }

    //MARK: data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuCollectionViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MenuCell
        cell.addLabel(label: self.menuCollectionViewData[indexPath.count])
        cell.backgroundColor = UIColor.blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}

