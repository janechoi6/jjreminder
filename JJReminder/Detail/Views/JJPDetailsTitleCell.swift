//
//  JJPDetailsTitleCell.swift
//  JJReminder
//
//  Created by Band iOS on 2018. 3. 5..
//  Copyright © 2018년 JJProject. All rights reserved.
//

import UIKit

class JJPDetailsTitleCell: UITableViewCell {

    @IBOutlet weak var titleTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleTextView.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    static func registerToTableView(tableView: UITableView) -> Void {
//        let className: String = String(describing: JJPDetailsTitleCell.self)
//        tableView.register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
//    }
//    
//    static func dequeueReusableCellToTableView(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> JJPDetailsTitleCell {
//        let className: String = String(describing: JJPDetailsTitleCell.self)
//        return tableView.dequeueReusableCell(withIdentifier: className, for: indexPath) as! JJPDetailsTitleCell
//    }
}
