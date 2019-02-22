//
//  ServerAPI.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/1/23.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import Foundation


class ServerAPI {
    
    class func register(phone: String, password: String, onSuccess: @escaping (_ response: Any) -> ()) {
        let params = [
            "phone": phone,
            "password": password
        ]
        HttpManager<User>.post(url: URLConstants.REGISTER, params: params, onSuccess: onSuccess)
    }
    
    class func login(phone: String, userName: String, password: String, onSuccess: @escaping (_ response: Any) -> ()) {
        let params = [
            "phone": phone,
            "userName": userName,
            "password": password
        ]
        HttpManager<User>.post(url: URLConstants.LOGIN, params: params, onSuccess: onSuccess)
    }
    
    class func addRecord(userID: String, weight: String, waistline: String, hipline: String, thighline: String, onSuccess: @escaping (_ response: Any) -> ()) {
        let params = [
            "userID": userID,
            "weight": weight,
            "waistline": waistline,
            "hipline": hipline,
            "thighline": thighline
        ]
        HttpManager<String>.post(url: URLConstants.ADD_RECORD, params: params, onSuccess: onSuccess)
    }
    
    class func getRecords(userID: String, pageNum: String, pageSize: String, onSuccess: @escaping (_ response: Any) -> ()) {
        let params = [
            "userID": userID,
            "pageNum": pageNum,
            "pageSize": pageSize
        ]
        HttpManager<RecordHistoryResponse>.get(url: URLConstants.GET_RECORDS, params: params, onSuccess: onSuccess)
    }
    
}
