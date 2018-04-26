//
//  JJPDetailsSelectionTableViewModel.swift
//  JJReminder
//
//  Created by JiminYoo on 2018. 4. 23..
//  Copyright © 2018년 JJProject. All rights reserved.
//

import Foundation

enum DetailsRepeatSelectionRow: JJPTableViewRowProtocol {
    case NoRepeat
    case EveryDay
    case EveryWeek
    case EveryMonth
    
    fileprivate func title() -> String {
        switch self {
        case .NoRepeat:
            return NSLocalizedString("details.repeat.never", comment: "")
        case .EveryDay:
            return NSLocalizedString("details.repeat.everyDay", comment: "")
        case .EveryWeek:
            return NSLocalizedString("details.repeat.everyWeek", comment: "")
        case .EveryMonth:
            return NSLocalizedString("details.repeat.everyMonth", comment: "")
        }
    }
}

enum DetailsPrioritySelectionRow: JJPTableViewRowProtocol {
    case PriorityNone
    case PriorityLow
    case PriorityMidium
    case PriorityHigh
    
    fileprivate func title() -> String {
        switch self {
        case .PriorityNone:
            return NSLocalizedString("details.priority.none", comment: "")
        case .PriorityLow:
            return NSLocalizedString("details.priority.low", comment: "")
        case .PriorityMidium:
            return NSLocalizedString("details.priority.medium", comment: "")
        case .PriorityHigh:
            return NSLocalizedString("details.priority.high", comment: "")
        }
    }
}

enum DetailsSelectionType {
    case repaet
    case priority
    case list
}

struct JJPDetailsSelectionTableViewModel {
    
    var selectionType: DetailsSelectionType
    
    init(type: DetailsSelectionType) {
        selectionType = type
    }
    
    func titleText(_ selectedIndexPath: IndexPath) -> String {
        
        let type = configure[selectedIndexPath.section][selectedIndexPath.row]
        switch selectionType {
        case .repaet:
            return (type as! DetailsRepeatSelectionRow).title()
        case .priority:
            return (type as! DetailsPrioritySelectionRow).title()
        case .list:
            return (type as! DetailsRepeatSelectionRow).title()
        }
    }
}

extension JJPDetailsSelectionTableViewModel: JJPTableViewConfigureProtocol {
    var configure: [[JJPTableViewRowProtocol]] {
        return [
            selectionRows()
        ]
    }
    
    func selectionRows() -> [JJPTableViewRowProtocol] {
        var rows = [JJPTableViewRowProtocol]()
        if selectionType == .repaet {
            rows.append(DetailsRepeatSelectionRow.EveryDay)
            rows.append(DetailsRepeatSelectionRow.EveryWeek)
            rows.append(DetailsRepeatSelectionRow.EveryMonth)
        } else if selectionType == .priority {
            rows.append(DetailsPrioritySelectionRow.PriorityNone)
            rows.append(DetailsPrioritySelectionRow.PriorityLow)
            rows.append(DetailsPrioritySelectionRow.PriorityMidium)
            rows.append(DetailsPrioritySelectionRow.PriorityHigh)
        }
        return rows
    }
}

extension JJPDetailsSelectionTableViewModel: JJPTableviewDataSourceProtocol {
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
