//
//  CoursesTableViewCell.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {
    
    @IBOutlet var courseName: UILabel!
    @IBOutlet var courseProfessor: UILabel!
    @IBOutlet var courseImage: UIImageView!
    
    var course: Course! {
        didSet {
            courseName.text = course.name
            courseProfessor.text = course.professor
            courseImage.image = UIImage(named: "default-profile-picture")
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
