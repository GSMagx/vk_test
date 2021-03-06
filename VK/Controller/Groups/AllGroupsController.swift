//
//  AllGroupsController.swift
//  VK
//
//  Created by ALEKSANDR KIRILENKOV on 14/01/2019.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

class AllGroupsController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
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
        searchBar.scopeButtonTitles = ["All","Coding","Music", "Social"]
    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchActive {
            return filteredGroup.count
        } else {
            return allGroups.count
        }
    }
    

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as! AllGroupsCell

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
        } else {
            cell.allGroupsName.text = allGroups[indexPath.row]
        
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

extension AllGroupsController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredGroup = allGroups.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased() })
        searchActive = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        searchBar.text = ""
        tableView.reloadData()
    }
}

