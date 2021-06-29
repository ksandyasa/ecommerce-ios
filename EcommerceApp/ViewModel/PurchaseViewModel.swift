//
//  PurchaseViewModel.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 24/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation


class PurchaseViewModel {
    
    weak var dataSource: GenericDataSource<Product>?
    
    init(dataSource: GenericDataSource<Product>?) {
        self.dataSource = dataSource
    }
    
    func loadPurchase() {
        let productsFromRealm = DatabaseManager.shared.fetchProducts()
        print("products from realm: ",productsFromRealm.count)
        let products = RealmParser.shared.getProductsFromRealm(products: productsFromRealm)
        self.dataSource?.data.value = products
    }
    
}
