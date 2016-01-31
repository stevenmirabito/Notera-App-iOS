//
//  ClassmatesTableViewCell.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class ClassmatesTableViewCell: UITableViewCell {
    
    @IBOutlet var classmateName: UILabel!
    @IBOutlet var classmateCourses: UILabel!
    @IBOutlet var classmateProfilePicture: UIImageView!
    
    var user: User! {
        didSet {
            classmateName.text = user.commonName
            if let courses = user.courses {
                var courseNames = [String]()
                for course in courses {
                    courseNames.append(course.name)
                }
                
                classmateCourses.text = courseNames.joinWithSeparator(",")
            } else {
                classmateCourses.text = "No courses in common."
            }
            classmateProfilePicture.image = user.profilePicture
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        classmateProfilePicture.layer.borderWidth = 1
        classmateProfilePicture.layer.borderColor = UIColor.lightGrayColor().CGColor
        classmateProfilePicture.layer.cornerRadius = classmateProfilePicture.frame.height/2
        classmateProfilePicture.layer.masksToBounds = false
        classmateProfilePicture.clipsToBounds = true
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
