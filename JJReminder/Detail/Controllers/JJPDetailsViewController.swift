//
//  JJPDetailsViewController.swift
//  JJReminder
//
//  Created by JiminYoo on 2018. 2. 18..
//  Copyright © 2018년 jjproject. All rights reserved.
//

import UIKit

class JJPDetailsViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
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
        
        tableView.estimatedRowHeight = 44
        
        /* RegisterCell */
        JJPDetailsTitleCell.registerToTableView(tableView: tableView)
        JJPDetailsDescriptionCell.registerToTableView(tableView: tableView)
        JJPDetailsSwitchCell.registerToTableView(tableView: tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Action

    @objc func touchUpInsideLeftBarButtonItem(_ barButtonItem: UIBarButtonItem) -> Void {
        dismiss(animated: true, completion: nil)
    }

    @objc func touchUpInsideRightBarButtonItem(_ barButtonItem: UIBarButtonItem) -> Void {
        print("click - right")
    }
}

// MARK: - UITableViewDataSource
extension JJPDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return JJPDetailsTableViewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JJPDetailsTableViewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowType = JJPDetailsTableViewModel.configure[indexPath.section].rowTypes[indexPath.row] as! DetailsTableViewRow
        
        if rowType == .Title {
            let cell = JJPDetailsTitleCell.dequeueReusableCellToTableView(tableView: tableView, cellForRowAt: indexPath) as! JJPDetailsTitleCell
            cell.titleTextView.delegate = self as? UITextViewDelegate
            return cell
            
        } else if rowType == .Description {
            let cell = JJPDetailsDescriptionCell.dequeueReusableCellToTableView(tableView: tableView, cellForRowAt: indexPath)
            return cell
            
        } else if rowType == .Status {
            let cell = JJPDetailsSwitchCell.dequeueReusableCellToTableView(tableView: tableView, cellForRowAt: indexPath) as! JJPDetailsSwitchCell
            cell.titleLabel.text = NSLocalizedString("details.title.complete", comment: "")
            cell.onOffSwitchCompletion = { (isOn: Bool) -> Void in
                if isOn {
                    print("on")
                } else {
                    print("off")
                }
            }
            
            return cell
            
        } else if rowType == .IsAlarm {
            let cell = JJPDetailsSwitchCell.dequeueReusableCellToTableView(tableView: tableView, cellForRowAt: indexPath) as! JJPDetailsSwitchCell
            cell.titleLabel.text = NSLocalizedString("details.title.usingAlarm", comment: "")
            cell.onOffSwitchCompletion = { (isOn: Bool) -> Void in
                if isOn {
                    print("on")
                } else {
                    print("off")
                }
            }
            return cell
            
        } else if rowType == .Alarm {
            let cell = UITableViewCell.systemDetailStyleCellToTableView(tableView: tableView)
            cell.textLabel?.text = "title"
            cell.detailTextLabel?.text = "details"
            
            return cell
        } else if rowType == .AlarmRepeat {
            let cell = UITableViewCell.systemDetailStyleCellToTableView(tableView: tableView, accessoryType: .disclosureIndicator)
            cell.textLabel?.text = "title"
            cell.detailTextLabel?.text = "details"
            
            return cell
            
        } else if rowType == .Priority {
            let cell = UITableViewCell.systemDetailStyleCellToTableView(tableView: tableView, accessoryType: .disclosureIndicator)
            cell.textLabel?.text = "title"
            cell.detailTextLabel?.text = "details"
            
            return cell
            
        } else if rowType == .List {
            let cell = UITableViewCell.systemDetailStyleCellToTableView(tableView: tableView, accessoryType: .disclosureIndicator)
            cell.textLabel?.text = "title"
            cell.detailTextLabel?.text = "details"
            
            return cell
            
        } else if rowType == .Delete {
            let cell = UITableViewCell.systemDefaultStyleCellToTableView(tableView: tableView)
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.text = NSLocalizedString("details.title.delete", comment: "")
            
            return cell
        }
        
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: UITableViewCell.className)
        cell.textLabel?.text = "** Invalid Cell **"
        return cell
    }
}

// MARK: - UITableViewDelegate
extension JJPDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rowType = JJPDetailsTableViewModel.configure[indexPath.section].rowTypes[indexPath.row] as! DetailsTableViewRow
        
        if rowType == .Alarm {
            
        } else if rowType == .AlarmRepeat {
            
        } else if rowType == .Priority {
            
        } else if rowType == .List {
            
        } else if rowType == .Delete {
            let alertController = UIAlertController.init(title: nil, message: NSLocalizedString("details.alert.message.delete", comment: ""), preferredStyle: .alert)
            let noAction = UIAlertAction.init(title: NSLocalizedString("no", comment: ""), style: .cancel, handler:nil)
            let yesAction = UIAlertAction.init(title: NSLocalizedString("yes", comment: ""), style: .default, handler: { _ in
                print("삭제 원츄~")
            })
            
            alertController.addAction(noAction)
            alertController.addAction(yesAction)
            
            present(alertController, animated: true, completion: nil)
        }
    }
}


