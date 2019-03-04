//
//  HistoryType.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/2/28.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import Foundation

struct HistoryType {
    var icon: String?
    var title: String?
    var type: Record.RecordType?
    
    init(icon: String, title: String, type: Record.RecordType) {
        self.icon = icon
        self.title = title
        self.type = type
    }

}
