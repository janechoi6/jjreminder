//
//  NSObject+.swift
//  JJReminder
//
//  Created by JiminYoo on 2018. 3. 9..
//  Copyright © 2018년 JJProject. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    static var className: String {
        return String(describing: self)
    }
}
