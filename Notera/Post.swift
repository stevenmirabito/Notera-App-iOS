//
//  Post.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class Post: NSObject, NSCoding {
    
    let user: User
    let timestamp: NSDate
    let postText: String
    //let attachments: ??
    
    private let usernameKey = "username"
    private let timestampKey = "timestamp"
    private let postTextKey = "postText"
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(user.username, forKey: usernameKey)
        aCoder.encodeObject(timestamp, forKey: timestampKey)
        aCoder.encodeObject(postText, forKey: postTextKey)
    }
    
    required init?(coder aDecoder: NSCoder) {
        user = User(username: aDecoder.decodeObjectForKey(usernameKey) as! String)
        timestamp = aDecoder.decodeObjectForKey(timestampKey) as! NSDate
        postText = aDecoder.decodeObjectForKey(postTextKey) as! String
    }
    
    init(user: User, timestamp: NSDate, postText: String) {
        self.user = user
        self.timestamp = timestamp
        self.postText = postText
    }
    
}