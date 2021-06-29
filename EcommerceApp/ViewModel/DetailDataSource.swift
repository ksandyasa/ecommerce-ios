//
//  DetailDataSource.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 24/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

protocol DetailDelegate: class {
    func notifyAlreadyPurchased()
    func notfiyPurchased()
    func shareDetailProduct(title: String)
}

class DetailDataSource: GenericDataSource<Product>, UITableViewDataSource, UITableViewDelegate, DetailBottomDelegate, DetailImageDelegate {
    
    weak var delegate: DetailDelegate?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0) {
            let imageCell = tableView.dequeueReusableCell(withIdentifier: "DetailImageCell") as! DetailImageCell
            imageCell.selectionStyle = .none
            imageCell.delegate = self
            imageCell.product = data.value[0]
            
            return imageCell
        } else if (indexPath.row == 1) {
            let titleCell = tableView.dequeueReusableCell(withIdentifier: "DetailTitleCell") as! DetailTitleCell
            titleCell.selectionStyle = .none
            titleCell.product = data.value[0]
            
            return titleCell
        } else if (indexPath.row == 2) {
            let descCell = tableView.dequeueReusableCell(withIdentifier: "DetailDescCell") as! DetailDescCell
            descCell.selectionStyle = .none
            descCell.product = data.value[0]
            
            return descCell
        } else {
            let bottomCell = tableView.dequeueReusableCell(withIdentifier: "DetailBottomCell") as! DetailBottomCell
            bottomCell.selectionStyle = .none
            bottomCell.product = data.value[0]
            bottomCell.delegate = self
            
            return bottomCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func sendAlreadyPurchased() {
        delegate?.notifyAlreadyPurchased()
    }
    
    func sendPurchased() {
        delegate?.notfiyPurchased()
    }
    
    func shareDetail(title: String) {
        delegate?.shareDetailProduct(title: title)
    }
        
}
