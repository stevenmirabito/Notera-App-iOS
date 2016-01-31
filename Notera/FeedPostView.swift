//
//  FeedPostView.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit
import Haneke

class FeedPostView: UIView {
    
    @IBOutlet weak var userProfilePicture: UIImageView!
    @IBOutlet weak var userCommonName: UILabel!
    @IBOutlet weak var postingTime: UILabel!
    @IBOutlet weak var postText: UITextView!
    
    private let dateFormatter = NSDateFormatter()
    
    var note: Note! {
        didSet {
            dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
            dateFormatter.timeStyle = .ShortStyle
            
            userProfilePicture.hnk_setImageFromURL(NSURL(string: note.author.gravatarUrl)!)
            userCommonName.text = note.author.realName
            postingTime.text = dateFormatter.stringFromDate(note.timestamp)
            postText.text = note.body
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userProfilePicture.layer.borderWidth = 1
        userProfilePicture.layer.borderColor = UIColor.lightGrayColor().CGColor
        userProfilePicture.layer.cornerRadius = userProfilePicture.frame.height/2
        userProfilePicture.layer.masksToBounds = false
        userProfilePicture.clipsToBounds = true
    }

}
