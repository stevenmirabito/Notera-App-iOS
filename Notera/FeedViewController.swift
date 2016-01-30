//
//  ClassmatesViewController.swift
//  Notera
//
//  Created by Steven Mirabito on 1/29/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class FeedViewController: UITableViewController {
    
    let postsManager = PostsManager()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsManager.posts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FeedItem", forIndexPath: indexPath) as! FeedPostTableViewCell
        cell.feedPostView.post = postsManager.posts[indexPath.row]
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

