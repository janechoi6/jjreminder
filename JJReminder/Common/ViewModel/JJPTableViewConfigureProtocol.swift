//
//  JJPTableViewConfigureProtocol.swift
//  JJReminder
//
//  Created by JiminYoo on 2018. 3. 16..
//  Copyright © 2018년 JJProject. All rights reserved.
//

import Foundation

protocol JJPTableViewConfigureProtocol {
    var configure: [[JJPTableViewRowProtocol]] { get }
}

protocol JJPTableviewDataSourceProtocol {
    var numberOfSections: Int { get }
    func numberOfRowsInSection(section: Int) -> Int
    func rowType(indexPath: IndexPath) -> JJPTableViewRowProtocol
}

protocol JJPTableViewRowProtocol {
}
