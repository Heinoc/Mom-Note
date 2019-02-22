//
//  RecordHistoryResponse.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/2/12.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import Foundation

struct RecordHistoryResponse: Codable {
    var pageNum: Int?
    var pageSize: Int?
    var totalPages: Int?
    var list: [Record]?
    
}
