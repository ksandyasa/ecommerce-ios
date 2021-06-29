//
//  RoundCornerTextField.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 03/02/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable
class RoundCornerTextField: UITextField {
    
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            updateFrames()
        }
    }
    
    @IBInspectable var enabledLeftTopCorner: Bool = false {
        didSet {
            updateFrames()
        }
    }
    
    @IBInspectable var enabledRightTopCorner: Bool = false {
        didSet {
            updateFrames()
        }
    }
    
    @IBInspectable var enabledLeftBottomCorner: Bool = false {
        didSet {
            updateFrames()
        }
    }
    
    @IBInspectable var enabledRightBottomCorner: Bool = false {
        didSet {
            updateFrames()
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0) {
        didSet {
            updateFrames()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            updateFrames()
        }
    }
    
    func updateFrames() {
        if #available(iOS 11.0, *){
            if (self.enabledLeftTopCorner == false && self.enabledLeftBottomCorner == false && self.enabledRightTopCorner == false && self.enabledRightBottomCorner == false) {
                self.layer.maskedCorners = []
            } else if (self.enabledLeftTopCorner == true && self.enabledLeftBottomCorner == false && self.enabledRightTopCorner == false && self.enabledRightBottomCorner == false) {
                self.layer.maskedCorners = [.layerMinXMinYCorner]
            } else if (self.enabledLeftTopCorner == false && self.enabledLeftBottomCorner == true && self.enabledRightTopCorner == false && self.enabledRightBottomCorner == false) {
                self.layer.maskedCorners = [.layerMinXMaxYCorner]
            } else if (self.enabledLeftTopCorner == false && self.enabledLeftBottomCorner == false && self.enabledRightTopCorner == true && self.enabledRightBottomCorner == false) {
                self.layer.maskedCorners = [.layerMaxXMinYCorner]
            } else if (self.enabledLeftTopCorner == false && self.enabledLeftBottomCorner == false && self.enabledRightTopCorner == false && self.enabledRightBottomCorner == true) {
                self.layer.maskedCorners = [.layerMaxXMaxYCorner]
            } else if (self.enabledLeftTopCorner == true && self.enabledLeftBottomCorner == true && self.enabledRightTopCorner == false && self.enabledRightBottomCorner == false) {
                self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            } else if (self.enabledLeftTopCorner == true && self.enabledLeftBottomCorner == false && self.enabledRightTopCorner == true && self.enabledRightBottomCorner == false) {
                self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            } else if (self.enabledLeftTopCorner == true && self.enabledLeftBottomCorner == false && self.enabledRightTopCorner == false && self.enabledRightBottomCorner == true) {
                self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
            } else if (self.enabledLeftTopCorner == false && self.enabledLeftBottomCorner == true && self.enabledRightTopCorner == true && self.enabledRightBottomCorner == false) {
                self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]
            } else if (self.enabledLeftTopCorner == false && self.enabledLeftBottomCorner == true && self.enabledRightTopCorner == false && self.enabledRightBottomCorner == true) {
                self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            } else if (self.enabledLeftTopCorner == false && self.enabledLeftBottomCorner == false && self.enabledRightTopCorner == true && self.enabledRightBottomCorner == true) {
                self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            } else if (self.enabledLeftTopCorner == true && self.enabledLeftBottomCorner == true && self.enabledRightTopCorner == true && self.enabledRightBottomCorner == false) {
                self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner]
            } else if (self.enabledLeftTopCorner == true && self.enabledLeftBottomCorner == true && self.enabledRightTopCorner == false && self.enabledRightBottomCorner == true) {
                self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            } else if (self.enabledLeftTopCorner == false && self.enabledLeftBottomCorner == true && self.enabledRightTopCorner == true && self.enabledRightBottomCorner == true) {
                self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            } else if (self.enabledLeftTopCorner == true && self.enabledLeftBottomCorner == true && self.enabledRightTopCorner == true && self.enabledRightBottomCorner == true) {
                self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            }
        } else {
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            if (self.enabledLeftTopCorner == false && self.enabledLeftBottomCorner == false && self.enabledRightTopCorner == false && self.enabledRightBottomCorner == false) {
                rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [], cornerRadii: CGSize(width: self.cornerRadius, height: self.cornerRadius)).cgPath
            } else if (self.enabledLeftTopCorner == true && self.enabledLeftBottomCorner == false && self.enabledRightTopCorner == false && self.enabledRightBottomCorner == false) {
                rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft], cornerRadii: CGSize(width: self.cornerRadius, height: self.cornerRadius)).cgPath
            } else if (self.enabledLeftTopCorner == false && self.enabledLeftBottomCorner == true && self.enabledRightTopCorner == false && self.enabledRightBottomCorner == false) {
                rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft], cornerRadii: CGSize(width: self.cornerRadius, height: self.cornerRadius)).cgPath
            } else if (self.enabledLeftTopCorner == false && self.enabledLeftBottomCorner == false && self.enabledRightTopCorner == true && self.enabledRightBottomCorner == false) {
                rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight], cornerRadii: CGSize(width: self.cornerRadius, height: self.cornerRadius)).cgPath
            } else if (self.enabledLeftTopCorner == false && self.enabledLeftBottomCorner == false && self.enabledRightTopCorner == false && self.enabledRightBottomCorner == true) {
                rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomRight], cornerRadii: CGSize(width: self.cornerRadius, height: self.cornerRadius)).cgPath
            } else if (self.enabledLeftTopCorner == true && self.enabledLeftBottomCorner == true && self.enabledRightTopCorner == false && self.enabledRightBottomCorner == false) {
                rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: self.cornerRadius, height: self.cornerRadius)).cgPath
            } else if (self.enabledLeftTopCorner == true && self.enabledLeftBottomCorner == false && self.enabledRightTopCorner == true && self.enabledRightBottomCorner == false) {
                rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: self.cornerRadius, height: self.cornerRadius)).cgPath
            } else if (self.enabledLeftTopCorner == true && self.enabledLeftBottomCorner == false && self.enabledRightTopCorner == false && self.enabledRightBottomCorner == true) {
                rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: self.cornerRadius, height: self.cornerRadius)).cgPath
            } else if (self.enabledLeftTopCorner == false && self.enabledLeftBottomCorner == true && self.enabledRightTopCorner == true && self.enabledRightBottomCorner == false) {
                rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .topRight], cornerRadii: CGSize(width: self.cornerRadius, height: self.cornerRadius)).cgPath
            } else if (self.enabledLeftTopCorner == false && self.enabledLeftBottomCorner == true && self.enabledRightTopCorner == false && self.enabledRightBottomCorner == true) {
                rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: self.cornerRadius, height: self.cornerRadius)).cgPath
            } else if (self.enabledLeftTopCorner == false && self.enabledLeftBottomCorner == false && self.enabledRightTopCorner == true && self.enabledRightBottomCorner == true) {
                rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: self.cornerRadius, height: self.cornerRadius)).cgPath
            } else if (self.enabledLeftTopCorner == true && self.enabledLeftBottomCorner == true && self.enabledRightTopCorner == true && self.enabledRightBottomCorner == false) {
                rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomLeft, .topRight], cornerRadii: CGSize(width: self.cornerRadius, height: self.cornerRadius)).cgPath
            } else if (self.enabledLeftTopCorner == true && self.enabledLeftBottomCorner == true && self.enabledRightTopCorner == false && self.enabledRightBottomCorner == true) {
                rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: self.cornerRadius, height: self.cornerRadius)).cgPath
            } else if (self.enabledLeftTopCorner == false && self.enabledLeftBottomCorner == true && self.enabledRightTopCorner == true && self.enabledRightBottomCorner == true) {
                rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight, .bottomRight], cornerRadii: CGSize(width: self.cornerRadius, height: self.cornerRadius)).cgPath
            } else if (self.enabledLeftTopCorner == true && self.enabledLeftBottomCorner == true && self.enabledRightTopCorner == true && self.enabledRightBottomCorner == true) {
                rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomLeft, .topRight, .bottomRight], cornerRadii: CGSize(width: self.cornerRadius, height: self.cornerRadius)).cgPath
            }
            self.layer.mask = rectShape
        }

        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderColor = self.borderColor.cgColor
        self.layer.borderWidth = self.borderWidth
        self.layer.masksToBounds = true
    }
}
