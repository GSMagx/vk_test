//
//  AllGroupsController.swift
//  VK
//
//  Created by ALEKSANDR KIRILENKOV on 14/01/2019.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

class AllGroupsController: UITableViewController {
    
    var allGroups = ["Swift Programming",
                     "Hobbys",
                     "X-Plane 11",
                     "Hacking",
                     "Dancing",
                     "Job IT",
                     "Russia Today",
                     "English"
    ]
    
    var fotoAllGroups = [
        "Programming"    :["Programming_foto"],
        "Hobbys"         :["Hobbys_foto"],
        "X-Plane 11"     :["X-Plane 11_foto"],
        "Hacking"        :["Hacking_foto"],
        "Dancing"        :["Dancing_foto"],
        "Job IT"         :["Job IT_foto"],
        "Russia Today"   :["Russia Today_foto"],
        "English"        :["English_foto"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(fotoAllGroups)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as! AllGroupsCell
        let group = allGroups[indexPath.row]
            cell.allGroupsName.text = group
        
        return cell
    }
    

    

}
