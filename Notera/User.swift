//
//  User.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class User: NSObject, NSCoding {
    
    let username: String
    let email: String
    let commonName: String
    let profilePicture: UIImage
    
    private let usernameKey = "username"
    private let emailKey = "email"
    private let commonNameKey = "commonName"
    private let profilePictureKey = "profilePicture"
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(username, forKey: usernameKey)
        aCoder.encodeObject(email, forKey: emailKey)
        aCoder.encodeObject(commonName, forKey: commonNameKey)
        if profilePicture != UIImage.init(named: "default-profile-picture") {
            // Only save the profile picture if it's not the default
            aCoder.encodeObject(profilePicture, forKey: profilePictureKey)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        username = aDecoder.decodeObjectForKey(usernameKey) as! String
        email = aDecoder.decodeObjectForKey(emailKey) as! String
        commonName = aDecoder.decodeObjectForKey(commonNameKey) as! String
        
        if aDecoder.containsValueForKey(profilePictureKey) {
            profilePicture = aDecoder.decodeObjectForKey(profilePictureKey) as! UIImage
        } else {
            profilePicture = UIImage.init(named: "default-profile-picture")!
        }
        
    }
    
    init(username: String, email: String, commonName: String) {
        self.username = username
        self.email = email
        self.commonName = commonName
        self.profilePicture = UIImage.init(named: "default-profile-picture")!
    }
    
    init(username: String) {
        self.username = username
        // pull userdata from API here...
        self.email = "not@implemented.com"
        self.commonName = "Testing Tester"
        self.profilePicture = UIImage.init(named: "default-profile-picture")!
    }
    
}