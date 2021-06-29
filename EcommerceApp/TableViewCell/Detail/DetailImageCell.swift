//
//  DetailImageCell.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 24/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


protocol DetailImageDelegate: class {
    func shareDetail(title: String)
}

class DetailImageCell: UITableViewCell {
    
    weak var delegate: DetailImageDelegate?
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailShare: UIImageView!
    
    var product: Product? {
        didSet {
            
            guard let product = product else {
                
                return
            }
            
            loadDetailImage(imageUrl: product.imageUrl)
            
            let shareTap = UITapGestureRecognizer(target: self, action: #selector(shareDetailProduct))
            detailShare.addGestureRecognizer(shareTap)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    private func loadDetailImage(imageUrl: String) {
        RestApi.shared.loadImageFromUrl(imageUrl: imageUrl, completion: { (data: Data) in
            //print(dataHome.description)
            self.detailImageView.image = UIImage(data: data)
        })

    }
    
    @objc func shareDetailProduct() {
        delegate?.shareDetail(title: product!.title)
    }

}
