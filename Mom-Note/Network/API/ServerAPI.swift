//
//  ServerAPI.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/1/23.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import Foundation


class ServerAPI {
    
    class func register(phone: String,
                        password: String,
                        onSuccess: @escaping (_ response: Any) -> (),
                        onFail: @escaping (_ errMsg: String) -> ()) {
        let params = [
            "phone": phone,
            "password": password
        ]
        HttpManager<User>.post(url: URLConstants.REGISTER, params: params, onSuccess: onSuccess, onFail: onFail)
    }
    
    class func login(phone: String,
                     userName: String,
                     password: String,
                     onSuccess: @escaping (_ response: Any) -> (),
                     onFail: @escaping (_ errMsg: String) -> ()) {
        let params = [
            "phone": phone,
            "userName": userName,
            "password": password
        ]
        HttpManager<User>.post(url: URLConstants.LOGIN, params: params, onSuccess: onSuccess, onFail: onFail)
    }
    
    class func addRecord(userID: String,
                         record: Record,
                         onSuccess: @escaping (_ response: Any) -> (),
                         onFail: @escaping (_ errMsg: String) -> ()) {
        let params = [
            "userID": userID,
            "weight": record.weight ?? "0",
            "armline": record.armline ?? "0",
            "waistline": record.waistline ?? "0",
            "bust": record.bust ?? "0",
            "hipline": record.hipline ?? "0",
            "thighline": record.thighline ?? "0"
        ]
        HttpManager<String>.post(url: URLConstants.ADD_RECORD, params: params, onSuccess: onSuccess, onFail: onFail)
    }
    
    class func getRecords(userID: String,
                          pageNum: String,
                          pageSize: String,
                          onSuccess: @escaping (_ response: Any) -> (),
                          onFail: @escaping (_ errMsg: String) -> ()) {
        let params = [
            "userID": userID,
            "pageNum": pageNum,
            "pageSize": pageSize
        ]
        HttpManager<RecordHistoryResponse>.get(url: URLConstants.GET_RECORDS, params: params, onSuccess: onSuccess, onFail: onFail)
    }
    
}
