//
//  Product.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 24/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import SwiftyJSON


protocol JSONable {
    init?(parameter: JSON)
}

class Product: JSONable {
    
    var id: String!
    var imageUrl: String!
    var title: String!
    var desc: String!
    var price: String!
    var loved: Int!
    
    required init(parameter: JSON) {
        id          = parameter["id"].string
        imageUrl    = parameter["imageUrl"].string
        title       = parameter["title"].string
        desc        = parameter["description"].string
        price       = parameter["price"].string
        loved       = parameter["loved"].int
    }
        
}
