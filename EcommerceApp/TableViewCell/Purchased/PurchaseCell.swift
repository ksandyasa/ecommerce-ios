//
//  PurchaseCell.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 24/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import UIKit


class PurchaseCell: UITableViewCell {
    
    @IBOutlet weak var purchaseImageView: UIImageView!
    @IBOutlet weak var purchaseTitle: UILabel!
    @IBOutlet weak var purchasePrice: UILabel!
    
    var product: Product? {
        didSet {
            
            guard let product = product else {
                
                return
            }
            
            purchaseTitle?.text = product.title
            loadPurchaseImage(imageUrl: product.imageUrl)
            purchasePrice?.text = product.price
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    private func loadPurchaseImage(imageUrl: String) {
        RestApi.shared.loadImageFromUrl(imageUrl: imageUrl, completion: { (data: Data) in
            //print(dataHome.description)
            self.purchaseImageView.image = UIImage(data: data)
        })

    }
    
}
