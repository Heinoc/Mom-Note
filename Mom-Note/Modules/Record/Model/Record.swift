//
//  Record.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/2/11.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import Foundation


struct Record: Codable {
//    记录时间
    var createdTime: String?
//    体重
    var weight: String?
//    臂围
    var armline: String?
//    腰围
    var waistline: String?
//    胸围
    var bust: String?
//    臀围
    var hipline: String?
//    大腿围
    var thighline: String?
    
    // 根据RecordType返回对应的记录
    func getItemValue(by: RecordType) -> String {
        switch by {
        case RecordType.WEIGHT:
            return self.weight ?? "0"
        case RecordType.ARM_LINE:
            return self.armline ?? "0"
        case RecordType.WAIST_LINE:
            return self.waistline ?? "0"
        case RecordType.BUST:
            return self.bust ?? "0"
        case RecordType.HIP_LINE:
            return self.hipline ?? "0"
        case RecordType.THIGH_LINE:
            return self.thighline ?? "0"
        }
    }
    
    enum RecordType {
        case WEIGHT
        case ARM_LINE
        case WAIST_LINE
        case BUST
        case HIP_LINE
        case THIGH_LINE
    }
    
}
