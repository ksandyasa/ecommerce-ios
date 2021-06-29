//
//  DetailDescCell.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 24/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


class DetailDescCell: UITableViewCell {
    
    @IBOutlet weak var detailDesc: UILabel!
    
    var product: Product? {
        didSet {
            
            guard let product = product else {
                
                return
            }
            
            detailDesc?.text = product.desc
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
