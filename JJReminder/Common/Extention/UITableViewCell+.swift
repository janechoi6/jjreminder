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
    
    static func systemDefaultStyleCellToTableView(tableView: UITableView, accessoryType: UITableViewCellAccessoryType = UITableViewCellAccessoryType.none) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "systemDefaultStyleCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "systemDefaultStyleCell")
        }
        cell?.selectionStyle = .none
        cell?.accessoryType = accessoryType
     
        return cell!
    }
    
    static func systemDetailStyleCellToTableView(tableView: UITableView, accessoryType: UITableViewCellAccessoryType = UITableViewCellAccessoryType.none) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "systemDetailStyleCell")
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "systemDetailStyleCell")
        }
        cell?.selectionStyle = .none
        cell?.accessoryType = accessoryType
        
        return cell!
    }
}


