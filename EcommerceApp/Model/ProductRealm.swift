//
//  ProductRealm.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 24/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import RealmSwift


class ProductRealm: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var imageUrl = ""
    @objc dynamic var title = ""
    @objc dynamic var desc = ""
    @objc dynamic var price = ""
    @objc dynamic var loved = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
