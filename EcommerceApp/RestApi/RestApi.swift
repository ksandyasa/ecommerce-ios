//
//  RestApi.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 21/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


struct RestApi {
    
    static var shared = RestApi()
    
    func getHomeData(completion: @escaping (JSON) -> ()) {
        AF.request(URLParser.getURL(urlString: Constant.homeApi())!).responseJSON { (response) -> Void in
            switch response.result {
            case .success(let value):
                let swiftyJsonVar = JSON(value)
                completion(swiftyJsonVar)
            case .failure(let error):
                print ("error is \(error)")
            }
        }
    }
    
    func loadImageFromUrl(imageUrl: String, completion: @escaping (Data) -> ()) {
        AF.request(URLParser.getURL(urlString: imageUrl)!).responseData { (response) -> Void in
            completion(response.data!)
        }
    }
    
}
