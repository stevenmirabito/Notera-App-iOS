//
//  User.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit
import SwiftyJSON

class Student {
    
    let id: Int
    let username: String
    let realName: String
    let email: String
    let gravatarUrl: String
    
    convenience init(json: JSON){
        let id = json["id"].intValue
        let username = json["username"].stringValue
        let realName = json["realname"].stringValue
        let email = json["email"].stringValue
        let gravatarUrl = json["gravatar"].stringValue
        self.init(id: id, username: username, realName: realName, email: email, gravatarUrl: gravatarUrl)
    }
    
    init(id: Int, username: String, realName: String, email: String, gravatarUrl: String) {
        self.id = id
        self.username = username
        self.realName = realName
        self.email = email
        self.gravatarUrl = gravatarUrl
    }
    
}