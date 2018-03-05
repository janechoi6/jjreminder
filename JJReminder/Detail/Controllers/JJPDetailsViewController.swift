//
//  JJPDetailsViewController.swift
//  JJReminder
//
//  Created by JiminYoo on 2018. 2. 18..
//  Copyright © 2018년 jjproject. All rights reserved.
//

import UIKit

enum SectionType: Int {
    case Title = 0
    case Alarm
    case Option
    case Delete
}

class JJPDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    // tableDataSource
    var tableViewMap: [(SectionType.RawValue, [String])] {
        return [
            //section 0 - title / description
            (SectionType.Title.rawValue, [
                "title",
                "desctiption",
                "status"
            ]),
            // section 1 - alaram
            (SectionType.Alarm.rawValue, [
                "is_alarm",
                "alarm",
                "alarm_repeat"
            ]),
            // section 2 - option
            (SectionType.Option.rawValue, [
                "priority",
                "list"
            ]),
            // section 3 - delete
            (SectionType.Delete.rawValue, [
                "delete"
            ])
        ]
    }
    
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
        // RegisterCell
        JJPDetailsTitleCell.registerToTableView(tableView: tableView)
        JJPDetailsDescriptionCell.registerToTableView(tableView: tableView)
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
        let sectionInfo:(section: Int, rowInfo: [String]) = tableViewMap[section]
        if section == SectionType.Alarm.rawValue {
            //TODO: 알람 사용 유무
            
        }
        return sectionInfo.rowInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == SectionType.Title.rawValue {
            //TODO: 더 이쁜 row == Int 판별법을 생각해보자.
            if indexPath.row == 0 {
                let cell: JJPDetailsTitleCell = JJPDetailsTitleCell.dequeueReusableCellToTableView(tableView: tableView, cellForRowAt: indexPath) as! JJPDetailsTitleCell
                
                return cell
            } else if indexPath.row == 1 {
                let cell = JJPDetailsDescriptionCell.dequeueReusableCellToTableView(tableView: tableView, cellForRowAt: indexPath)
                
                return cell
            }
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") {
            cell.textLabel?.text = "hi"
            
            return cell
        } else {
            let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "tableCell")
            cell.textLabel?.text = "hello"
            
            return cell
        }
    }
    
    
    // MARK: - Action
    
    @objc func touchUpInsideLeftBarButtonItem(_ barButtonItem: UIBarButtonItem) -> Void {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func touchUpInsideRightBarButtonItem(_ barButtonItem: UIBarButtonItem) -> Void {
        print("click - right")
    }


}
