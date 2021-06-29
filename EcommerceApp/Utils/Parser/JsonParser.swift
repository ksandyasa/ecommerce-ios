//
//  JsonParser.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 24/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper


class JsonParser {
    
    static let shared = JsonParser()
    
    func getProducts(products: [JSON]) -> [Product] {
        var result: [Product] = [Product]()
        
        for i in stride(from: 0, to: products.count, by: 1) {
            let product = products[i].to(type: Product.self) as! Product
            result.append(product)
            print("product id: ", product.id)
        }
        
        return result
    }
    
}

