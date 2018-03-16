//
//  JJPTableViewConfigureProtocol.swift
//  JJReminder
//
//  Created by JiminYoo on 2018. 3. 16..
//  Copyright © 2018년 JJProject. All rights reserved.
//

import Foundation

protocol JJTableViewConfigureProtocol {
    static var configure: [(sectionType: JJPTableViewSectionProtocol, rowTypes: [JJPTableViewRowProtocol])] { get };
    static var numberOfSections: Int { get };
    static func numberOfRowsInSection(section: Int) -> Int;
}

protocol JJPTableViewSectionProtocol {
}

protocol JJPTableViewRowProtocol {
}
