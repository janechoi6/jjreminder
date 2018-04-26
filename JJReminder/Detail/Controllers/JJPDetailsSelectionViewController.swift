//
//  JJPDetailsSelectionViewController.swift
//  JJReminder
//
//  Created by JiminYoo on 2018. 4. 23..
//  Copyright © 2018년 JJProject. All rights reserved.
//

import UIKit

class JJPDetailsSelectionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var tableViewMedel: JJPDetailsSelectionTableViewModel!
    private var selectedIndex: Int!
    var selectionCompletion: ((_ selectedIndex: Int) -> Void)?
    
    convenience init(selectionType: DetailsSelectionType, selectedIndex: Int) {
        self.init()
        self.tableViewMedel = JJPDetailsSelectionTableViewModel.init(type: selectionType)
        self.selectedIndex = selectedIndex
    }
    
    deinit {
        print("JJDetailsSelectionVC is being deinitialized")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupViews()
    }
    
    func setupNavigationBar() -> Void {
        var title: String
        switch tableViewMedel.selectionType {
        case .repaet:
            title = NSLocalizedString("details.title.repeat", comment: "")
        case .priority:
            title = NSLocalizedString("details.title.priority", comment: "")
        case .list:
            title = NSLocalizedString("details.title.list", comment: "")
        }
        navigationController?.title = title
        
        let rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("done", comment: ""), style: .done, target: self, action: #selector(touchUpInsideRightBarButtonItem(_:)))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setupViews() -> Void {
        tableView.estimatedRowHeight = 44
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action
    @objc func touchUpInsideRightBarButtonItem(_ barButtonItem: UIBarButtonItem) -> Void {
        selectionCompletion?(selectedIndex)
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableViewDataSource
extension JJPDetailsSelectionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewMedel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewMedel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var accessoryType = UITableViewCellAccessoryType.none
        if selectedIndex == indexPath.row {
            accessoryType = .checkmark
        }
        
        let cell = UITableViewCell.systemDefaultStyleCellToTableView(tableView: tableView, accessoryType: accessoryType)
        cell.textLabel?.text = tableViewMedel.titleText(indexPath)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension JJPDetailsSelectionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        tableView.reloadData()
    }
}
