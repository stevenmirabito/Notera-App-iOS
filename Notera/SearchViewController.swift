//
//  SearchViewController.swift
//  Notera
//
//  Created by Steven Mirabito on 1/31/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, UISearchResultsUpdating {
    
    var searchData: NSArray?
    var viewTitle: String?
    var delegate: SearchReturnDelegate?
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredData = [AnyObject]()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchController.active && searchController.searchBar.text != "") {
            return filteredData.count
        } else {
            if let data = searchData {
                return data.count
            } else {
                return 0
            }
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("searchItemCell", forIndexPath: indexPath)
        
        if (searchController.active && searchController.searchBar.text != "") {
            cell.textLabel!.text = filteredData[indexPath.row].name as String
        } else if let data = searchData {
            cell.textLabel!.text = data[indexPath.row].name as String
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.searchReturn(searchData![indexPath.row])
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredData = (searchData?.filter { AnyObject in
            return AnyObject.name.lowercaseString.containsString(searchText.lowercaseString)
        })!
        
        tableView.reloadData()
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let title = viewTitle {
            self.title = title
        }
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        
        // Set up search bar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
