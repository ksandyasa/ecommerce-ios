//
//  GlobalVariable.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 24/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import SwiftyJSON


class GlobalVariable {
    
    static let shared = GlobalVariable()
    
    var detailItem = [Product]()
    var searchList = [Product]()
}
