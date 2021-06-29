//
//  RealmParser.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 24/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON


class RealmParser {
    
    static let shared = RealmParser()
    
    func getProductsFromRealm(products: [ProductRealm]) -> [Product] {
        var result: [Product] = [Product]()
        
        for i in stride(from: 0, to: products.count, by: 1) {
            var json = JSON()
            json["id"].string = products[i].id
            json["title"].string = products[i].title
            json["description"].string = products[i].desc
            json["imageUrl"].string = products[i].imageUrl
            json["price"].string = products[i].price
            json["loved"].int = products[i].loved
            let product = Product(parameter: json)
            result.append(product)
        }
                
        return result
    }
    
    func checkIfProductRealmExist(product: ProductRealm) -> Bool {
        let products = DatabaseManager.shared.fetchProducts()
        var isExist = false
        
        for i in stride(from: 0, to: products.count, by: 1) {
            if (product.id == products[i].id) {
                isExist = true
                
                return isExist
            }
        }
        
        return isExist
    }
    
}
