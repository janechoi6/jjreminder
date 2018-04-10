//
//  JJPTableViewConfigureProtocol.swift
//  JJReminder
//
//  Created by JiminYoo on 2018. 3. 16..
//  Copyright © 2018년 JJProject. All rights reserved.
//

import Foundation

protocol JJTableViewConfigureProtocol {
    var configure: [(sectionType: JJPTableViewSectionProtocol, rowTypes: [JJPTableViewRowProtocol])] { get };
    var numberOfSections: Int { get };
    func numberOfRowsInSection(section: Int) -> Int;
}

protocol JJPTableViewSectionProtocol {
}

protocol JJPTableViewRowProtocol {
}
