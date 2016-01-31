//
//  ClassmatesManager.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class ClassmatesManager {
    var classmates = [User]()
    
    class func archivePath() -> String? {
        let directoryList = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        if let documentsPath = directoryList.first {
            return documentsPath + "/Notera/Classmates"
        }
        assertionFailure("Could not determine where to save file!")
        return nil
    }
    
    func save() {
        if let theArchivePath = ClassmatesManager.archivePath() {
            if NSKeyedArchiver.archiveRootObject(classmates, toFile: theArchivePath) {
                print("Saved successfully.")
            } else {
                assertionFailure("Could not save data to \(theArchivePath)")
            }
        }
    }
    
    func unarchiveSavedItems() {
        if let theArchivePath = ClassmatesManager.archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                classmates = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [User]
            } else {
                // Demo data
                classmates = [
                    User(username: "houttlences", email: "danielplehmann@dayrep.com", commonName: "Daniel Lehmann"),
                    User(username: "Thow1983", email: "rosemhunter@armyspy.com", commonName: "Rose Hunter"),
                    User(username: "opent1966", email: "robertaportugal@rhyta.com", commonName: "Robert Portugal")
                ]
            }
        }
    }
    
    init() {
        unarchiveSavedItems()
    }
}