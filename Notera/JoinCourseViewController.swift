//
//  JoinCourseViewController.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class JoinCourseViewController: UITableViewController, SearchReturnDelegate {
    
    @IBOutlet var schoolTableCell: UITableViewCell!
    @IBOutlet var courseTableCell: UITableViewCell!
    
    let schoolManager = SchoolManager()
    var selectedSchool: School?
    var selectedCourse: Course?
    
    @IBAction func cancelToCourseView(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func joinCourseAndReturn(sender: AnyObject) {
        // do something here to join the course
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let searchView = mainStoryboard.instantiateViewControllerWithIdentifier("searchView") as! SearchViewController
        
        if (indexPath.section == 0) {
            // Select school
            searchView.searchData = schoolManager.schools
            searchView.viewTitle = "Select School"
            searchView.delegate = self
            self.navigationController?.pushViewController(searchView, animated: true)
        } else if (indexPath.section == 1) {
            // Select course
            if let school = selectedSchool {
                searchView.searchData = school.courses
                searchView.viewTitle = "Select Course"
                searchView.delegate = self
                self.navigationController?.pushViewController(searchView, animated: true)
            }
        }
    }
    
    func searchReturn(value: AnyObject?) {
        if let school = value as? School {
            selectedSchool = school
            schoolTableCell.textLabel?.text = school.name
            schoolTableCell.textLabel?.textColor = UIColor.blackColor()
            
            // Enable the course selector
            courseTableCell.backgroundColor = UIColor.whiteColor()
            courseTableCell.userInteractionEnabled = true
        } else if let course = value as? Course {
            selectedCourse = course
            courseTableCell.textLabel?.text = course.name
            courseTableCell.textLabel?.textColor = UIColor.blackColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
