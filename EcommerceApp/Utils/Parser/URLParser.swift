//
//  URLParser.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 21/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation


class URLParser {
    
    static func getURL(urlString: String) -> URL? {
        let url = URL(string: urlString)

        return url
    }
        
}
