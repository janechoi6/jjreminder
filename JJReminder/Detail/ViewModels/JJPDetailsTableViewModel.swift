//
//  JJPDetailsTableViewModel.swift
//  JJReminder
//
//  Created by JiminYoo on 2018. 3. 16..
//  Copyright © 2018년 JJProject. All rights reserved.
//

import Foundation

enum DetailsRow : JJPTableViewRowProtocol {
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
    
    // 인드로 섹션 정보
    func introRows() -> [JJPTableViewRowProtocol] {
        var rows = [JJPTableViewRowProtocol]()
        rows.append(DetailsRow.Title)
        rows.append(DetailsRow.Description)
        if !isCreate {
            rows.append(DetailsRow.Status)
        }
        
        return rows
    }
    
    // 알람 섹션 정보
    func alaramRows() -> [JJPTableViewRowProtocol] {
        var rows = [JJPTableViewRowProtocol]()
        rows.append(DetailsRow.IsAlarm)
        if task.shouldAlarm {
            rows.append(DetailsRow.Alarm)
            rows.append(DetailsRow.AlarmRepeat)
        }
        
        return rows
    }
    
    // 옵션 섹션 정보
    func optionRows() -> [JJPTableViewRowProtocol] {
        var rows = [JJPTableViewRowProtocol]()
        rows.append(DetailsRow.Priority)
        rows.append(DetailsRow.List)
        
        return rows
    }
    
    // 삭제 섹선 정
    func deleteRows() -> [JJPTableViewRowProtocol] {
        var rows = [JJPTableViewRowProtocol]()
        if !isCreate {
            rows.append(DetailsRow.Delete)
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

