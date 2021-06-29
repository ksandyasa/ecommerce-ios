//
//  SearchDataSource.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 03/02/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import UIKit

protocol SearchDelegate: class {
    func goToDetail(products: Product?)
}

class SearchDataSource: GenericDataSource<Product>, UITableViewDataSource, UITableViewDelegate {
    
    weak var delegate: SearchDelegate?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (data.value.count > 0) ? data.value.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseCell") as! PurchaseCell
        cell.selectionStyle = .none
        
        if (data.value.count > 0) {
            cell.product = data.value[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        delegate?.goToDetail(products: self.data.value[indexPath.row])
    }
    
}
