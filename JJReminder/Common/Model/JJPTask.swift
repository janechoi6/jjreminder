//
//  JJPTask.swift
//  JJReminder
//
//  Created by Naver on 2018. 3. 5..
//  Copyright © 2018년 JJProject. All rights reserved.
//

import Foundation

class JJPTask {
    var taskID: Int
    var title: String
    var status: Bool
    
    init(taskID: Int, title: String, status: Bool) {
        self.taskID = taskID
        self.title = title
        self.status = status
    }
}
