//
//  ClassmatesViewController.swift
//  Notera
//
//  Created by Steven Mirabito on 1/29/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class ClassmatesViewController: UITableViewController {

    let studentManager = StudentManager()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentManager.classmates.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ClassmateRow", forIndexPath: indexPath) as! ClassmatesTableViewCell
        cell.student = studentManager.classmates[indexPath.row]
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

