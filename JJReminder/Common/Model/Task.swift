//
//  Task.swift
//  JJReminder
//
//  Created by Naver on 2018. 3. 5..
//  Copyright © 2018년 JJProject. All rights reserved.
//

import Foundation

class Task {
    var taskID: Int
    var title: String
    var status: Bool
    
    init(taskID: Int, title: String, status: Bool) {
        self.taskID = taskID
        self.title = title
        self.status = status
    }
}
