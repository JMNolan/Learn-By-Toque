//
//  MenuLauncher.swift
//  Learn By Toque
//
//  Created by John Nolan on 12/17/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import UIKit

class MenuLauncher: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let dimView = UIView()
    let menuCollectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    let cellID = "cellID"
    let menuCollectionViewData: [String] = [
        "Progress by month",
        "Progress by week",
        "Lifetime statistics"
    ]
    var height: CGFloat!
    var width: CGFloat!
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    @objc func showMenu() {
        //TODO: present menu and dim background
        if let window = UIApplication.shared.keyWindow {
            dimView.backgroundColor = UIColor.black
            dimView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissDimView)))
            window.addSubview(dimView)
            window.addSubview(menuCollectionView)
            
            height = window.frame.height
            width = window.frame.width/2
            menuCollectionView.frame = CGRect(x: -width, y: 0, width: width, height: height)
            dimView.frame = window.frame
            dimView.alpha = 0
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.dimView.alpha = 0.5
                self.menuCollectionView.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height)
            }, completion: nil)
        }
    }
    
    @objc func dismissDimView() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.dimView.alpha = 0
            self.menuCollectionView.frame = CGRect(x: -self.menuCollectionView.frame.width , y: 0, width: self.menuCollectionView.frame.width, height: self.menuCollectionView.frame.height)
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuCollectionViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MenuCell
        cell.addLabel(label: menuCollectionViewData[indexPath.item])
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.cornerRadius = 3
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: setup switch statement to determine the text of the cell selected and execute the appropriate function
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 30)
    }
    
    override init() {
        super.init()
        layout.sectionInset = UIEdgeInsets(top: 50, left: 5, bottom: 1, right: 5)
        layout.minimumInteritemSpacing = 1
        menuCollectionView.collectionViewLayout = layout
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        menuCollectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellID)
    }
}
