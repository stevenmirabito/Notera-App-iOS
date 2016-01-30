//
//  FeedPostView.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class FeedPostView: UIView {
    
    @IBOutlet weak var userProfilePicture: UIImageView!
    @IBOutlet weak var userCommonName: UILabel!
    @IBOutlet weak var postingTime: UILabel!
    @IBOutlet weak var postText: UITextView!
    
    private let dateFormatter = NSDateFormatter()
    
    var post: Post! {
        didSet {
            dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
            dateFormatter.timeStyle = .ShortStyle
            
            userProfilePicture.image = post.user.profilePicture
            userCommonName.text = post.user.commonName
            postingTime.text = dateFormatter.stringFromDate(post.timestamp)
            postText.text = post.postText
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
