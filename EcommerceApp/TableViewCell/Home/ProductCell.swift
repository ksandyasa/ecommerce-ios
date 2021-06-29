//
//  ProductCell.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 21/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


class ProductCell: UITableViewCell {
    
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productLoved: UIImageView!
    
    var product: Product? {
        didSet {
            
            guard let product = product else {
                
                return
            }
            
            productTitle?.text = product.title
            loadProductImage(imageUrl: product.imageUrl)
            productLoved.image = (product.loved == 1) ? UIImage(named: "icon_love_fill") : UIImage(named: "icon_love_empty")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    private func loadProductImage(imageUrl: String) {
        RestApi.shared.loadImageFromUrl(imageUrl: imageUrl, completion: { (data: Data) in
            //print(dataHome.description)
            self.productImageView.image = UIImage(data: data)
        })

    }
    
}
