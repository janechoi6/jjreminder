//
//  JJPDetailsViewController.swift
//  JJReminder
//
//  Created by JiminYoo on 2018. 2. 18..
//  Copyright © 2018년 jjproject. All rights reserved.
//

import UIKit

enum SectionType: Int {
    case IntroSection
    case AlarmSection
    case OptionSection
    case DeleteSection
}

enum RowType: Int {
    case TitleRow
    case DescriptionRow
    case StatusRow
    case IsAlarmRow
    case AlarmRow
    case AlarmRepeatRow
    case PriorityRow
    case ListRow
    case DeleteRow
}

class JJPDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    // tableDataSource
    var tableViewMap: [(sectionType: SectionType, rowTypes: [RowType])] {
        return [
            //section 0 - Intro
            (SectionType.IntroSection, [
                RowType.TitleRow,
                RowType.DescriptionRow,
                RowType.StatusRow
            ]),
            // section 1 - alaram
            (SectionType.AlarmSection, [
                RowType.IsAlarmRow,
                RowType.AlarmRow,
                RowType.AlarmRepeatRow
            ]),
            // section 2 - option
            (SectionType.OptionSection, [
                RowType.PriorityRow,
                RowType.ListRow
            ]),
            // section 3 - delete
            (SectionType.DeleteSection, [
                RowType.DeleteRow
            ])
        ]
    }
    
    let isAlarmTableViewCellName = "isAlarmTableViewCell"
    let statusTableCellName = "statusTableCell"
    let alarmTableCellName = "alarmTableCell"
    let alarmRepeatTableCellName = "alarmRepeatTableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupViews()
    }

    func setupNavigationBar() -> Void {
        // title
        navigationItem.title = NSLocalizedString("details", comment: "")
        
        // left Item(SystemItem)
        let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(touchUpInsideLeftBarButtonItem(_:)))
        navigationItem.setLeftBarButton(leftBarButtonItem, animated: true)
        
        // right Item(title & UIBarButtonItemStyle)
        let rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("done", comment: ""), style: UIBarButtonItemStyle.done, target: self, action: #selector(touchUpInsideRightBarButtonItem(_:)))
        navigationItem.setRightBarButton(rightBarButtonItem, animated: true)
    }
    
    func setupViews() -> Void {
        /* RegisterCell */
        JJPDetailsTitleCell.registerToTableView(tableView: tableView)
        JJPDetailsDescriptionCell.registerToTableView(tableView: tableView)
        JJPDetailsSwitchCell.registerToTableView(tableView: tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewMap.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewMap[section].sectionType == .AlarmSection {
            //TODO: 알람 사용 유무
        }

        return tableViewMap[section].rowTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let rowType = tableViewMap[indexPath.section].rowTypes[indexPath.row]
        
        if rowType == .TitleRow {
            let cell: JJPDetailsTitleCell = JJPDetailsTitleCell.dequeueReusableCellToTableView(tableView: tableView, cellForRowAt: indexPath) as! JJPDetailsTitleCell
            return cell

        } else if rowType == .DescriptionRow {
            let cell = JJPDetailsDescriptionCell.dequeueReusableCellToTableView(tableView: tableView, cellForRowAt: indexPath)
            return cell

        } else if rowType == .StatusRow {
            let cell = UITableViewCell.detailStyleSystemCellToTableView(tableView: tableView, identifier: statusTableCellName, accessoryType: .disclosureIndicator)
            cell.textLabel?.text = "title"
            cell.detailTextLabel?.text = "details"
            
            return cell
            
        } else if rowType == .IsAlarmRow {
            let cell = JJPDetailsSwitchCell.dequeueReusableCellToTableView(tableView: tableView, cellForRowAt: indexPath)
            return cell
        } else if rowType == .AlarmRow {
            let cell = UITableViewCell.detailStyleSystemCellToTableView(tableView: tableView, identifier: statusTableCellName)
            cell.textLabel?.text = "title"
            cell.detailTextLabel?.text = "details"
            
            return cell
        } else if rowType == .AlarmRepeatRow {
            let cell = UITableViewCell.detailStyleSystemCellToTableView(tableView: tableView, identifier: statusTableCellName, accessoryType: .disclosureIndicator)
            cell.textLabel?.text = "title"
            cell.detailTextLabel?.text = "details"
            
            return cell
            
        } else if rowType == .PriorityRow {
            
        } else if rowType == .ListRow {
            
        } else if rowType == .DeleteRow {
            
        }
        
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: UITableViewCell.className)
        cell.textLabel?.text = "** Invalid Cell **"
        return cell
    }

    // MARK: - Action

    @objc func touchUpInsideLeftBarButtonItem(_ barButtonItem: UIBarButtonItem) -> Void {
        dismiss(animated: true, completion: nil)
    }

    @objc func touchUpInsideRightBarButtonItem(_ barButtonItem: UIBarButtonItem) -> Void {
        print("click - right")
    }


}
