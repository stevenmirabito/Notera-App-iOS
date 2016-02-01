//
//  SearchItemWrapper.swift
//  Notera
//
//  Created by Steven Mirabito on 1/31/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class SearchItemWrapper {
    
    let searchText: String
    let originalObject: AnyObject?
    
    init(searchText: String, originalObject: AnyObject?) {
        self.searchText = searchText
        self.originalObject = originalObject
    }
    
}