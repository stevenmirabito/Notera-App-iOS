//
//  School.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit
import SwiftyJSON

class School {
    
    let id: Int
    let name: String
    
    convenience init(json: JSON){
        let id = json["id"].intValue
        let name = json["name"].stringValue
        self.init(id: id, name: name)
    }
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
}