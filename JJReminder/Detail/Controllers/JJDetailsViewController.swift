//
//  JJDetailsViewController.swift
//  JJReminder
//
//  Created by JiminYoo on 2018. 2. 18..
//  Copyright © 2018년 jjproject. All rights reserved.
//

import UIKit

class JJDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

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
