//
//  Course.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit
import SwiftyJSON

class Course {
    
    let id: Int
    let name: String
    let professor: String
    let schoolId: Int
    
    convenience init(json: JSON){
        let id = json["id"].intValue
        let name = json["coursename"].stringValue
        let professor = json["professor"].stringValue
        let schoolId = json["school_id"].intValue
        self.init(id: id, name: name, professor: professor, schoolId: schoolId)
    }
    
    init(id: Int, name: String, professor: String, schoolId: Int) {
        self.id = id
        self.name = name
        self.professor = professor
        self.schoolId = schoolId
    }
    
}