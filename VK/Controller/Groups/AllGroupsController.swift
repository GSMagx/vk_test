//
//  AllGroupsController.swift
//  VK
//
//  Created by ALEKSANDR KIRILENKOV on 14/01/2019.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

extension AllGroupsController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}

class AllGroupsController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var allGroups = ["Swift Programming",
                     "Hobbys",
                     "X-Plane 11",
                     "Hacking",
                     "Dancing",
                     "Job IT",
                     "Russia Today",
                     "English"
    ]
    
    var allGroupsFoto = [
        "Swift Programming"    :"Swift Programming",
        "Hobbys"               :"Hobbys",
        "X-Plane 11"           :"X-Plane 11",
        "Hacking"              :"Hacking",
        "Dancing"              :"Dancing",
        "Job IT"               :"Job IT",
        "Russia Today"         :"Russia Today",
        "English"              :"English"
    ]

    var filteredGroup: [String] = []
    var searchActive : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            filteredGroup = allGroups.filter({(text) -> Bool in
                let tmp: NSString = text as NSString
                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                return range.location != NSNotFound
            })
            searchActive = true
            tableView.reloadData()}
        else {
            searchActive = false
            tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchActive = false
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroupsFoto.count
    }
    

    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchActive {
            return filteredGroup.count
        } else {
            return allGroups.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as! AllGroupsCell
//        let group = allGroups[indexPath.row]
//            cell.allGroupsName.text = group
     if searchActive {
        cell.allGroupsName.text = filteredGroup[indexPath.row]
        if let nameAvatar = allGroupsFoto[filteredGroup[indexPath.row]] {
            cell.allGroupsImage.backgroundColor = UIColor.white
            cell.allGroupsImage.layer.shadowColor = UIColor.black.cgColor
            cell.allGroupsImage.layer.cornerRadius = 20
            cell.allGroupsImage.layer.shadowOffset = cell.shadowOffset
            cell.allGroupsImage.layer.shadowOpacity = cell.shadowOpacity
            cell.allGroupsImage.layer.shadowRadius = cell.shadowRadius
            cell.allGroupsImage.layer.masksToBounds = false
            
            
            //add subview
            
            let borderView = UIView(frame: cell.allGroupsImage.bounds)
            borderView.frame = cell.allGroupsImage.bounds
            borderView.layer.cornerRadius = 20
            borderView.layer.masksToBounds = true
            cell.allGroupsImage.addSubview(borderView)
            
            //add subcontent
            let photo = UIImageView()
            photo.image = UIImage(named: nameAvatar)
            photo.frame = borderView.bounds
            borderView.addSubview(photo)
        }
        } else { cell.allGroupsName.text = allGroups[indexPath.row]
            //cell.allGroupName.text = group
            if let nameAvatar = allGroupsFoto[allGroups[indexPath.row]] {
                cell.allGroupsImage.backgroundColor = UIColor.clear
                cell.allGroupsImage.layer.shadowColor = UIColor.black.cgColor
                cell.allGroupsImage.layer.shadowOffset = cell.shadowOffset
                cell.allGroupsImage.layer.shadowOpacity = cell.shadowOpacity
                cell.allGroupsImage.layer.shadowRadius = cell.shadowRadius
                cell.allGroupsImage.layer.masksToBounds = false
                
                // add subview
                let borderView = UIView(frame: cell.allGroupsImage.bounds)
                borderView.frame = cell.allGroupsImage.bounds
                borderView.layer.cornerRadius = 20
                borderView.layer.masksToBounds = true
                cell.allGroupsImage.addSubview(borderView)
                
                // add subcontent
                let photo = UIImageView()
                photo.image = UIImage(named: nameAvatar)
                photo.frame = borderView.bounds
                borderView.addSubview(photo)
            }
            
        }
        
        return cell
    }
    

    

}
