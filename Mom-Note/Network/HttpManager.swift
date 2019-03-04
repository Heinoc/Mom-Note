//
//  HttpManager.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/1/23.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import Foundation
import Alamofire


class HttpManager<T: Codable> {
    class func get(url: String,
                   params: [String : Any]? = nil,
                   onSuccess: @escaping (_ result: T?) -> (),
                   onFail: @escaping (_ errMsg: String) -> ()) {
        print("HttpManager---->GET:" + url + "\nparams:")
        print(params!)
        AF.request(url, method: HTTPMethod.get, parameters: params).responseJSON { (response) in
            print("HttpManager---->GET:" + url + "\nresponse:")
            print(response)
            
            if (response.error == nil) {
                let responseModel = BaseResponse<T>(data:response.result.value!)
                onSuccess(responseModel?.result)
            } else {
                onFail(response.error?.localizedDescription ?? "网络请求失败！")
            }
        }
        
    }
    
    class func post(url: String,
                    params: [String : Any]? = nil,
                    onSuccess: @escaping (_ result: T?) -> (),
                    onFail: @escaping (_ errMsg: String) -> ()) {
        print("HttpManager---->POST:" + url + "\nparams:")
        print(params!)
        AF.request(url, method: HTTPMethod.post, parameters: params).responseJSON { (response) in
            print("HttpManager---->POST:" + url + "\nresponse:")
            print(response)
            
            if response.error == nil {
                let responseModel = BaseResponse<T>(data:response.result.value!)
                onSuccess(responseModel?.result)
            } else {
                onFail(response.error?.localizedDescription ?? "网络请求失败！")
            }
        }
    }
    

}
