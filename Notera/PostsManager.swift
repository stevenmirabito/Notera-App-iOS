//
//  PostsManager.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class PostsManager {
    var posts = [Post]()
    
    class func archivePath() -> String? {
        let directoryList = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        if let documentsPath = directoryList.first {
            return documentsPath + "/Notera"
        }
        assertionFailure("Could not determine where to save file!")
        return nil
    }
    
    func save() {
        if let theArchivePath = PostsManager.archivePath() {
            if NSKeyedArchiver.archiveRootObject(posts, toFile: theArchivePath) {
                print("Saved successfully.")
            } else {
                assertionFailure("Could not save data to \(theArchivePath)")
            }
        }
    }
    
    func unarchiveSavedItems() {
        if let theArchivePath = PostsManager.archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                posts = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [Post]
            } else {
                // Demo data
                let demoDateComponents = NSDateComponents()
                demoDateComponents.year = 2016
                demoDateComponents.month = 1
                demoDateComponents.day = 30
                demoDateComponents.hour = 15
                let demoDate = NSCalendar.currentCalendar().dateFromComponents(demoDateComponents)!
                posts = [
                    Post(user: User(username: "test"), timestamp: demoDate, postText: "Just testing!"),
                    Post(user: User(username: "test"), timestamp: demoDate, postText: "Just testing again!"),
                    Post(user: User(username: "test"), timestamp: demoDate, postText: "Just testing a third time!")
                ]
            }
        }
    }
    
    init() {
        unarchiveSavedItems()
    }
}