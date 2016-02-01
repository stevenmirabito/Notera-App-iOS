//
//  CoursesViewController.swift
//  Notera
//
//  Created by Steven Mirabito on 1/29/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class CoursesViewController: UITableViewController {

    let coursesManager = CoursesManager(schoolId: nil)
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coursesManager.courses.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CourseRow", forIndexPath: indexPath) as! CoursesTableViewCell
        cell.course = coursesManager.courses[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "Leave Course"
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            coursesManager.courses.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
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

