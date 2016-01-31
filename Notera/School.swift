//
//  School.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class School: NSObject, NSCoding {
    
    let name: String
    let courses: [Course]?
    
    private let nameKey = "name"
    private let coursesKey = "courses"
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: nameKey)
        aCoder.encodeObject(courses, forKey: coursesKey)
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey(nameKey) as! String
        courses = aDecoder.decodeObjectForKey(coursesKey) as? [Course]
    }
    
    init(name: String) {
        self.name = name
        self.courses = nil
    }
    
}