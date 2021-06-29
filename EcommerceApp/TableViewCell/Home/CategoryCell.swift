//
//  CategoryCell.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 22/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    var category: JSON? {
        didSet {
            
            guard let category = category else {
                
                return
            }
            
            categoryName?.text = category["name"].string
            loadCategoryImage(imageUrl: category["imageUrl"].string!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    private func loadCategoryImage(imageUrl: String) {
        RestApi.shared.loadImageFromUrl(imageUrl: imageUrl, completion: { (data: Data) in
            //print(dataHome.description)
            self.categoryImageView.image = UIImage(data: data)
        })

    }
    
}
