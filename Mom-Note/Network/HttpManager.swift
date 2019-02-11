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
    class func get(url: String, params: [String : Any]? = nil, onSuccess: @escaping (_ result: Any) -> ()) {
        print("HttpManager---->GET:" + url + "\nparams:")
        print(params!)
        AF.request(url, method: HTTPMethod.get, parameters: params).responseJSON { (response) in
            print("HttpManager---->GET:" + url + "\nresponse:")
            print(response)
            onSuccess(response)
        }
        
    }
    
    class func post(url: String, params: [String : Any]? = nil, onSuccess: @escaping (_ result: T?) -> ()) {
        print("HttpManager---->POST:" + url + "\nparams:")
        print(params!)
        AF.request(url, method: HTTPMethod.post, parameters: params).responseJSON { (response) in
            print("HttpManager---->POST:" + url + "\nresponse:")
            print(response)
            
//            let jsonDecoder = JSONDecoder()
//            let jsonData = try? JSONSerialization.data(withJSONObject: response.result.value!, options: [])
//            let responseModel: BaseResponse<T> = try! jsonDecoder.decode(BaseResponse<T>.self, from: jsonData!)
            let responseModel = BaseResponse<T>(data:response.result.value!)
            onSuccess(responseModel?.result)
        }
    }
    

}
