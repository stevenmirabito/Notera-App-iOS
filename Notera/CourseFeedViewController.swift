//
//  CourseFeedViewController.swift
//  Notera
//
//  Created by Steven Mirabito on 1/31/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class CourseFeedViewController: UITableViewController, AsyncRequestDelegate {

    var feedManager: CourseFeedManager?
    var courseId: Int?
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedManager!.notes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FeedItem", forIndexPath: indexPath) as! FeedPostTableViewCell
        
        let note = feedManager!.notes[indexPath.row]
        cell.feedPostView.note = note
        
        return cell
    }
    
    func dataLoadedCallback() {
        self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: .Automatic)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.estimatedRowHeight = 150.0
        tableView.rowHeight = UITableViewAutomaticDimension
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        if let courseId = courseId {
            self.feedManager = CourseFeedManager(courseId: courseId)
            self.feedManager!.delegate = self
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}