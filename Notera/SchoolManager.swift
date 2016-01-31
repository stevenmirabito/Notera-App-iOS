//
//  SchoolManager.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class SchoolManager {
    var schools = [School]()
    
    class func archivePath() -> String? {
        let directoryList = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        if let documentsPath = directoryList.first {
            return documentsPath + "/Notera/Schools"
        }
        assertionFailure("Could not determine where to save file!")
        return nil
    }
    
    func save() {
        if let theArchivePath = SchoolManager.archivePath() {
            if NSKeyedArchiver.archiveRootObject(schools, toFile: theArchivePath) {
                print("Saved successfully.")
            } else {
                assertionFailure("Could not save data to \(theArchivePath)")
            }
        }
    }
    
    func unarchiveSavedItems() {
        if let theArchivePath = SchoolManager.archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                schools = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [School]
            } else {
                // Demo data
                schools = [
                    School(name: "Rochester Institute of Technology"),
                    School(name: "University of Rochester"),
                    School(name: "Syracuse University")
                ]
            }
        }
    }
    
    init() {
        unarchiveSavedItems()
    }
}