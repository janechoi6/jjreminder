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
    
    var onOffSwitchCompletion: ( (_ isOn: Bool) -> Void )?
    
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
    }
    
    func setTitle(_ title: String, isSwitchOn: Bool) -> Void {
        titleLabel.text = title
         onOffSwitch.setOn(isSwitchOn, animated: true)
    }

    //MARK:- Action
    @IBAction private func valueChangedOnOffSwitch(_ sender: Any) {
        onOffSwitchCompletion?(onOffSwitch.isOn)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
