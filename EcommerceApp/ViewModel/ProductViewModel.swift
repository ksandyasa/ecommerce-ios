//
//  ProductViewModel.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 21/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ProductViewModel {
    
    weak var dataSource: GenericDataSource<Product>?
    weak var dataSource1: GenericDataSource<JSON>?
    
    init(dataSource: GenericDataSource<Product>?, dataSource1: GenericDataSource<JSON>?) {
        self.dataSource = dataSource
        self.dataSource1 = dataSource1
    }
    
    func fetchHome() {
        RestApi.shared.getHomeData(completion: { (dataHome: JSON) in
            //print(dataHome.description)
            let products = JsonParser.shared.getProducts(products: dataHome.array![0]["data"]["productPromo"].arrayValue)
            GlobalVariable.shared.searchList = products
            self.dataSource?.data.value = products
            self.dataSource1?.data.value = dataHome.array!
        })
    }
    
}
