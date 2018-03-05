//
//  UITableViewCell+Extention.swift
//  JJReminder
//
//  Created by Band iOS on 2018. 3. 5..
//  Copyright © 2018년 JJProject. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static func registerToTableView(tableView: UITableView) -> Void {
        let className: String = String(describing: self)
        tableView.register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
    }
    
    static func dequeueReusableCellToTableView(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let className: String = String(describing: self)
        return tableView.dequeueReusableCell(withIdentifier: className, for: indexPath)
    }
}
