//
//  JJPDetailsTableViewModel.swift
//  JJReminder
//
//  Created by JiminYoo on 2018. 3. 16..
//  Copyright © 2018년 JJProject. All rights reserved.
//

import Foundation

enum DetailsTableViewRow : JJPTableViewRowProtocol {
    case Title
    case Description
    case Status
    case IsAlarm
    case Alarm
    case AlarmRepeat
    case Priority
    case List
    case Delete
}

struct JJPDetailsTableViewModel {
    
    // 생성 or 수정
    var isCreate: Bool
    var task: Task!

    init(task: Task?) {
        if task == nil {
            self.isCreate = true
            self.task = Task(taskID: -1, title: nil, status: false, shouldAlarm: false, alarmAt: nil, createdAt: nil, shouldRepeat: false, priority: 0, listId: -1, memo: nil)
        } else {
            self.isCreate = false
            self.task = task!
        }
    }
}

extension JJPDetailsTableViewModel: JJPTableViewConfigureProtocol {
    var configure: [[JJPTableViewRowProtocol]] {
        return [
            introRows(),
            alaramRows(),
            optionRows(),
            deleteRows()
        ]
    }
    
    func introRows() -> [JJPTableViewRowProtocol] {
        var rows = [JJPTableViewRowProtocol]()
        rows.append(DetailsTableViewRow.Title)
        rows.append(DetailsTableViewRow.Description)
        if !isCreate {
            rows.append(DetailsTableViewRow.Status)
        }
        
        return rows
    }
    
    func alaramRows() -> [JJPTableViewRowProtocol] {
        var rows = [JJPTableViewRowProtocol]()
        rows.append(DetailsTableViewRow.IsAlarm)
        if task.shouldAlarm {
            rows.append(DetailsTableViewRow.Alarm)
            rows.append(DetailsTableViewRow.AlarmRepeat)
        }
        
        return rows
    }
    
    func optionRows() -> [JJPTableViewRowProtocol] {
        var rows = [JJPTableViewRowProtocol]()
        rows.append(DetailsTableViewRow.Priority)
        rows.append(DetailsTableViewRow.List)
        
        return rows
    }
    
    func deleteRows() -> [JJPTableViewRowProtocol] {
        var rows = [JJPTableViewRowProtocol]()
        if !isCreate {
            rows.append(DetailsTableViewRow.Delete)
        }
        
        return rows
    }
}

extension JJPDetailsTableViewModel: JJPTableviewDataSourceProtocol {
    var numberOfSections: Int {
        return configure.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return configure[section].count
    }
    
    func rowType(indexPath: IndexPath) -> JJPTableViewRowProtocol {
        return configure[indexPath.section][indexPath.row]
    }
}

