//
//  URLConstants.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/1/23.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import Foundation

struct URLConstants{
    static let URL_HOST = "http://localhost:9000"
    
    static let REGISTER = URL_HOST + "/api/user/register"
    static let LOGIN = URL_HOST + "/api/user/login"
    
    static let ADD_RECORD = URL_HOST + "/api/record/addRecord"
    static let GET_RECORDS = URL_HOST + "/api/record/getRecords"
}
