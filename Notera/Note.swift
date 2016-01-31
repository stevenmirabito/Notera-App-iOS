//
//  Post.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit
import SwiftyJSON

class Note {
    
    let id: Int
    let studentId: Int
    let author: Student
    let courseId: Int
    let title: String
    let body: String
    let timestamp: NSDate
    
    convenience init(json: JSON){
        let id = json["id"].intValue
        let studentId = json["student_id"].intValue
        let author = Student(json: json["author"])
        let courseId = json["course_id"].intValue
        let title = json["title"].stringValue
        let body = json["body"].stringValue
        let timestamp = NSDate()
        self.init(id: id, studentId: studentId, author: author, courseId: courseId, title: title, body: body, timestamp: timestamp)
    }
    
    init(id: Int, studentId: Int, author: Student, courseId: Int, title: String, body: String, timestamp: NSDate) {
        self.id = id
        self.studentId = studentId
        self.author = author
        self.courseId = courseId
        self.title = title
        self.body = body
        self.timestamp = timestamp
    }
    
}