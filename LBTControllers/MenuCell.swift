//
//  MenuCell.swift
//  Learn By Toque
//
//  Created by John Nolan on 12/17/18.
//  Copyright © 2018 John Nolan. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    var cellLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 2, width: UIScreen.main.bounds.width/2, height: 25))
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    
    //TODO: set up views within the cell
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addLabel(label: String) {
        cellLabel.text = label
        contentView.addSubview(cellLabel)
    }
}
