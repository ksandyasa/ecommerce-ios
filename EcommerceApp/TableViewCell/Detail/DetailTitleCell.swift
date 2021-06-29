//
//  DetailTitleCell.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 24/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class DetailTitleCell: UITableViewCell {
    
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailLoved: UIImageView!
    
    var product: Product? {
        didSet {
            
            guard let product = product else {
                
                return
            }
            
            detailTitle?.text = product.title
            detailLoved.image = (product.loved == 1) ? UIImage(named: "icon_love_fill") : UIImage(named: "icon_love_empty")
            let detailLovedTap = UITapGestureRecognizer(target: self, action: #selector(detailLovedClick))
            detailLoved.addGestureRecognizer(detailLovedTap)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @objc func detailLovedClick() {
        print("detailLovedClick")
        if (detailLoved.image == UIImage(named: "icon_love_fill")) {
            detailLoved.image = UIImage(named: "icon_love_empty")
        } else {
            detailLoved.image = UIImage(named: "icon_love_fill")
        }
    }
    
}
