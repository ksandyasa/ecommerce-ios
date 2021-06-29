//
//  DatabaseManager.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 24/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import RealmSwift


class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let realm = try! Realm()
    
    private init() {}
    
    func add(product: ProductRealm) {
        try! realm.write {
            realm.add(product)
        } 
    }
    
    func fetchProducts() -> [ProductRealm] {
        
        return Array(realm.objects(ProductRealm.self))
    }
    
}
