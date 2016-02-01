//
//  JoinCourseViewController.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class JoinCourseViewController: UITableViewController, SearchReturnDelegate, AsyncRequestDelegate {
    
    @IBOutlet var schoolTableCell: UITableViewCell!
    @IBOutlet var courseTableCell: UITableViewCell!
    
    let schoolManager = SchoolManager()
    var coursesManager: CoursesManager?
    var selectedSchool: School?
    var selectedCourse: Course?
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let searchView = mainStoryboard.instantiateViewControllerWithIdentifier("searchView") as! SearchViewController
        
        if (indexPath.section == 0) {
            // Select school
            searchView.searchData = [SearchItemWrapper]()
            for school in schoolManager.schools {
                searchView.searchData?.append(SearchItemWrapper(searchText: school.name, originalObject: school))
            }
            searchView.viewTitle = "Select School"
            searchView.delegate = self
            self.navigationController?.pushViewController(searchView, animated: true)
        } else if (indexPath.section == 1) {
            // Select course
            if selectedSchool !== nil {
                if let coursesManager = coursesManager {
                    searchView.searchData = [SearchItemWrapper]()
                    for course in coursesManager.courses {
                        searchView.searchData?.append(SearchItemWrapper(searchText: course.name, originalObject: course))
                    }
                    searchView.viewTitle = "Select Course"
                    searchView.delegate = self
                    self.navigationController?.pushViewController(searchView, animated: true)
                }
            }
        }
    }
    
    func searchReturn(value: SearchItemWrapper?) {
        if let school = value?.originalObject as? School {
            selectedSchool = school
            schoolTableCell.textLabel?.text = school.name
            schoolTableCell.textLabel?.textColor = UIColor.blackColor()
            
            // Reset course
            selectedCourse = nil
            courseTableCell.textLabel?.text = "Select a course..."
            courseTableCell.textLabel?.textColor = UIColor.lightGrayColor()
            courseTableCell.backgroundColor = UIColor.groupTableViewBackgroundColor()
            courseTableCell.userInteractionEnabled = false
            
            coursesManager = CoursesManager(schoolId: school.id)
            coursesManager?.delegate = self
        } else if let course = value?.originalObject as? Course {
            selectedCourse = course
            courseTableCell.textLabel?.text = course.name
            courseTableCell.textLabel?.textColor = UIColor.blackColor()
        }
    }
    
    func dataLoadedCallback() {
        // Enable the course selector
        courseTableCell.backgroundColor = UIColor.whiteColor()
        courseTableCell.userInteractionEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
