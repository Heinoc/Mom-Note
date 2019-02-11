//
//  BaseResponse.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/2/11.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import Foundation

struct BaseResponse<T> where T: Codable{
    var code: Int {
        guard let temp = json["code"] as? Int else {
            return -1
        }
        return temp
    }
    var msg: String? {
        guard let temp = json["msg"] as? String else {
            return nil
        }
        return temp
    }
    
    var result: T? {
        guard let temp = json["result"] else {
            return nil
        }
        let jsonDecoder = JSONDecoder()
        let jsonData = try? JSONSerialization.data(withJSONObject: temp, options: [])
        let responseModel: T = try! jsonDecoder.decode(T.self, from: jsonData!)
        return responseModel
    }
    
    var json: [String : Any]
    
    init?(data: Any) {
        guard let temp = data as? [String : Any] else {
            return nil
        }

        self.json = temp
        
        
    }
    
}
