//
//  JJPItemCollectionViewCell.swift
//  JJReminder
//
//  Created by Naver on 2018. 2. 27..
//  Copyright © 2018년 jjproject. All rights reserved.
//

import UIKit

class JJPItemCollectionViewCell: UICollectionViewCell {

    static let nibName = "JJPItemCollectionViewCell"
    static let reuseIdentifier = "JJPItemCollectionViewCellReuseID"
    
    @IBOutlet weak var statusButton: StatusButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func touchUpInsideStatusButton(_ sender: StatusButton) {
        
        statusButton.isSelected = !sender.isSelected
        
        
    }
}
