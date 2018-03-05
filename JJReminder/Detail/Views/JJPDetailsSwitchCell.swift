//
//  JJPDetailsSwitchCell.swift
//  JJReminder
//
//  Created by Band iOS on 2018. 3. 5..
//  Copyright © 2018년 JJProject. All rights reserved.
//

import UIKit

class JJPDetailsSwitchCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var onOffSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        initViews()
    }
    
    func initViews() {
        titleLabel.text = ""
        onOffSwitch.setOn(false, animated: false)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
