//
//  CoursesViewController.swift
//  Notera
//
//  Created by Steven Mirabito on 1/29/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class CoursesViewController: UITableViewController {

    @IBOutlet var postText: UILabel!
    @IBOutlet var postAttributes: UILabel!
    @IBOutlet var userCommonName: UILabel!
    @IBOutlet var userProfileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

