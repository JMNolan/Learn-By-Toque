//
//  MenuCell.swift
//  Learn By Toque
//
//  Created by John Nolan on 12/17/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    //TODO: set up views within the cell
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundView?.backgroundColor = UIColor.blue
        
    }
    
    func addLabel(label: String) {
        let cellLabel = UILabel.init()
        cellLabel.text = label
        contentView.addSubview(cellLabel)
    }
}
