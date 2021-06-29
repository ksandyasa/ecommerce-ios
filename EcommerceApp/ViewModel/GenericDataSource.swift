//
//  GenericDataSource.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 21/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation


class GenericDataSource<T>: NSObject {
    
    var data: DynamicValue<[T]> = DynamicValue([])
    
}
