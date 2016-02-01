//
//  SearchViewController.swift
//  Notera
//
//  Created by Steven Mirabito on 1/31/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, UISearchResultsUpdating {
    
    var searchData: [SearchItemWrapper]?
    var viewTitle: String?
    var delegate: SearchReturnDelegate?
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredData = [SearchItemWrapper]()
    
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
            cell.textLabel!.text = filteredData[indexPath.row].searchText
        } else if let data = self.searchData {
            cell.textLabel!.text = data[indexPath.row].searchText
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let searchItem: SearchItemWrapper
        if (searchController.active && searchController.searchBar.text != "") {
            searchItem = self.filteredData[indexPath.row]
        } else {
            searchItem = self.searchData![indexPath.row]
        }
        
        delegate?.searchReturn(searchItem)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredData = (searchData?.filter { SearchItemWrapper in
            return SearchItemWrapper.searchText.lowercaseString.containsString(searchText.lowercaseString)
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
