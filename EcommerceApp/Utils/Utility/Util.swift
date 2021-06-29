//
//  Util.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 03/02/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import UIKit


class Util {
    
    static let shared = Util()
    
    func setLeftImageViewOnTextField(textField: RoundCornerTextField, image: UIImage) -> RoundCornerTextField {
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: textField.frame.height, height: textField.frame.height))
        let leftImageView = UIImageView(frame: CGRect(x: 13.25, y: 10, width: 13.25, height: 13.25))
        leftImageView.contentMode = .scaleAspectFit
        leftImageView.image = image
        leftView.addSubview(leftImageView)
        textField.leftView = leftView
        textField.leftViewMode = .always
        
        return textField
    }

}
