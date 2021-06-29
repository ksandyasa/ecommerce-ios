//
//  ProductDataSource.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 21/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

protocol ProductDelegate: class {
    func navigateToDetail(products: Product?)
}

class ProductDataSource: GenericDataSource<Product>, UITableViewDataSource, UITableViewDelegate {
    
    weak var delegate: ProductDelegate?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (data.value.count > 0) ? data.value.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductCell
        cell.selectionStyle = .none
        
        if (data.value.count > 0) {
            let product = self.data.value[indexPath.row]
            cell.product = product
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked")
        delegate?.navigateToDetail(products: self.data.value[indexPath.row])
    }
    
}
