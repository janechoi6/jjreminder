//
//  Task.swift
//  JJReminder
//
//  Created by Naver on 2018. 3. 5..
//  Copyright © 2018년 JJProject. All rights reserved.
//

import Foundation

class Task {
    var taskID: Int?
    var title: String?
    var status: Bool = false
    var shouldAlarm: Bool = false
    var alarmAt: Date?
    var createdAt: Date?
    var shouldRepeat: Bool = false
    var priority: Int = 0
    var listId: Int = 0
    var memo: String?
    init() {
    }
    
    init(taskID: Int, title: String?, status: Bool, shouldAlarm: Bool, alarmAt: Date?, createdAt: Date?, shouldRepeat: Bool, priority: Int, listId: Int, memo: String?) {
        self.taskID = taskID
        self.title = title
        self.status = status
        self.shouldAlarm = shouldAlarm
        self.alarmAt = alarmAt
        self.createdAt = createdAt
        self.shouldRepeat = shouldRepeat
        self.priority = priority
        self.listId = listId
        self.memo = memo
    }
}
