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
        tableView.register(UINib(nibName: self.className, bundle: nil), forCellReuseIdentifier: self.className)
    }
    
    static func dequeueReusableCellToTableView(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: self.className, for: indexPath)
    }
    
    static func detailStyleSystemCellToTableView(tableView: UITableView, identifier: String, accessoryType: UITableViewCellAccessoryType = UITableViewCellAccessoryType.none) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: identifier)
        }
        cell?.accessoryType = accessoryType
        
        return cell!
    }
}


