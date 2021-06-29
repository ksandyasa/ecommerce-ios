//
//  DetailBottomCell.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 24/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

protocol DetailBottomDelegate: class {
    func sendAlreadyPurchased()
    func sendPurchased()
}

class DetailBottomCell: UITableViewCell {
    
    weak var delegate: DetailBottomDelegate?
    
    @IBOutlet weak var purchasedDetail: RoundCornerButton!
    @IBOutlet weak var detailPrice: UILabel!
    
    var product: Product? {
        didSet {
            
            guard let product = product else {
                
                return
            }
            
            detailPrice?.text = product.price
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func buyProduct(sender: Any) {
        print("BUY")
        let productRealm = ProductRealm()
        productRealm.id = product!.id
        productRealm.title = product!.title
        productRealm.desc = product!.desc
        productRealm.loved = product!.loved
        productRealm.price = product!.price
        productRealm.imageUrl = product!.imageUrl
        
        let isExist = RealmParser.shared.checkIfProductRealmExist(product: productRealm)
        
        if (isExist == false) {
            DatabaseManager.shared.add(product: productRealm)
            delegate?.sendPurchased()
        } else {
            print("Already purchased")
            delegate?.sendAlreadyPurchased()
        }
    }
}
