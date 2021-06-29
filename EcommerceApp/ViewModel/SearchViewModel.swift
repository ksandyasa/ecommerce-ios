//
//  SearchViewModel.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 03/02/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation


class SearchViewModel {
    
    weak var dataSource: GenericDataSource<Product>?
    
    init(dataSource: GenericDataSource<Product>?) {
        self.dataSource = dataSource
    }
    
    func searchProduct(keyString: String) {
        let products = GlobalVariable.shared.searchList
        let filtered = products.filter({($0.title.localizedCaseInsensitiveContains(keyString))})
        self.dataSource?.data.value = filtered
    }

    
}
