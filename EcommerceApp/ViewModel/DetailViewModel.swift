//
//  DetailViewModel.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 24/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation


struct DetailViewModel {
    
    weak var dataSource: GenericDataSource<Product>?
    
    init(dataSource: GenericDataSource<Product>?) {
        self.dataSource = dataSource
    }
    
    func loadDetail() {
        print("detailItem size: ", GlobalVariable.shared.detailItem.count)
        self.dataSource?.data.value = GlobalVariable.shared.detailItem
    }
}
