//
//  JJPDetailsTableViewModel.swift
//  JJReminder
//
//  Created by JiminYoo on 2018. 3. 16..
//  Copyright © 2018년 JJProject. All rights reserved.
//

import Foundation

enum DetailsTableViewSection: JJPTableViewSectionProtocol {
    case Intro
    case Alarm
    case Option
    case Delete
}

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

struct JJPDetailsTableViewModel: JJTableViewConfigureProtocol {
    static var configure: [(sectionType: JJPTableViewSectionProtocol, rowTypes: [JJPTableViewRowProtocol])] {
        return [
            // section 0 - Intro
            (DetailsTableViewSection.Intro, [
                DetailsTableViewRow.Title,
                DetailsTableViewRow.Description,
                DetailsTableViewRow.Status
                ]),
            // section 1 - alaram
            (DetailsTableViewSection.Alarm, [
                DetailsTableViewRow.IsAlarm,
                DetailsTableViewRow.Alarm,
                DetailsTableViewRow.AlarmRepeat
                ]),
            // section 2 - option
            (DetailsTableViewSection.Option, [
                DetailsTableViewRow.Priority,
                DetailsTableViewRow.List
                ]),
            // section 3 - delete
            (DetailsTableViewSection.Delete, [
                DetailsTableViewRow.Delete
                ])
        ]
    }
    
    static var numberOfSections: Int {
        return configure.count
    }
    
    static func numberOfRowsInSection(section: Int) -> Int {
//        if tableViewMap[section].sectionType == .AlarmSection {
//            //TODO: 알람 사용 유무
//        }
        
        return configure[section].rowTypes.count
    }
}
