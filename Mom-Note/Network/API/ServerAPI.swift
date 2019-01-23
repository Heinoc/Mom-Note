//
//  ServerAPI.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/1/23.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import Foundation


class ServerAPI {
    
    class func addRecord(userID: String, weight: String, waistline: String, onSuccess: @escaping (_ response: Any) -> ()) {
        let params = [
            "userID": userID,
            "weight": weight,
            "waistline": waistline
        ]
        HttpManager.post(url: URLConstants.ADD_RECORD, params: params, onSuccess: onSuccess)
    }
    
}
