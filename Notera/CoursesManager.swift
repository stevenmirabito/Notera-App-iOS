//
//  CoursesManager.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class CoursesManager {
    var courses = [Course]()
    
    class func archivePath() -> String? {
        let directoryList = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        if let documentsPath = directoryList.first {
            return documentsPath + "/Notera/Courses"
        }
        assertionFailure("Could not determine where to save file!")
        return nil
    }
    
    func save() {
        if let theArchivePath = PostsManager.archivePath() {
            if NSKeyedArchiver.archiveRootObject(courses, toFile: theArchivePath) {
                print("Saved successfully.")
            } else {
                assertionFailure("Could not save data to \(theArchivePath)")
            }
        }
    }
    
    func unarchiveSavedItems() {
        if let theArchivePath = PostsManager.archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                courses = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [Course]
            } else {
                // Demo data
                courses = [
                    Course(name: "CSCI-141: Computer Science I", professor: "Scott Johnson"),
                    Course(name: "PSYC-101: Introduction to Psychology", professor: "Jesemay Comer"),
                    Course(name: "MATH-182: Project-based Calculus II", professor: "Patricia Clark")
                ]
            }
        }
    }
    
    init() {
        unarchiveSavedItems()
    }
}