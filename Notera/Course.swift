//
//  Course.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class Course: NSObject, NSCoding {
    
    let name: String
    let professor: String
    let posts: [Note]?
    
    private let nameKey = "name"
    private let professorKey = "professor"
    private let postsKey = "posts"
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: nameKey)
        aCoder.encodeObject(professor, forKey: professorKey)
        aCoder.encodeObject(posts, forKey: postsKey)
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey(nameKey) as! String
        professor = aDecoder.decodeObjectForKey(professorKey) as! String
        posts = aDecoder.decodeObjectForKey(postsKey) as? [Note]
    }
    
    init(name: String, professor: String) {
        self.name = name
        self.professor = professor
        self.posts = nil
    }
    
}