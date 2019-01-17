//
//  NewsController.swift
//  VK
//
//  Created by Alex on 15.01.19.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

class NewsController: UITableViewController {

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
    
    var allMyNews = ["Swift Programming": "After officially delivering Swift 4.2, the Swift team is now focusing on Swift 5 by kicking off the final phase of its release process. Planned to be released early 2019, Swift 5 aims to bring ABI stability to the language while preserving source compatibility.",
        "Hobbys": "Police Can't Force You To Unlock Your Phone Using Face or Fingerprint Scan."]
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMyNews.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! MyNewsCell
        let group = allGroups[indexPath.row]
        cell.groupNewsName.text = group
        if let nameAvatar = allGroupsFoto[group] {
            cell.groupNewsFoto.backgroundColor = UIColor.clear
            cell.groupNewsFoto.layer.shadowColor = UIColor.black.cgColor
            cell.groupNewsFoto.layer.shadowOffset = cell.shadowOffset
            cell.groupNewsFoto.layer.shadowOpacity = cell.shadowOpacity
            cell.groupNewsFoto.layer.shadowRadius = cell.shadowRadius
            cell.groupNewsFoto.layer.masksToBounds = false
            
            // add subview
            let borderView = UIView(frame: cell.groupNewsFoto.bounds)
            borderView.frame = cell.groupNewsFoto.bounds
            borderView.layer.cornerRadius = 25
            borderView.layer.masksToBounds = true
            cell.groupNewsFoto.addSubview(borderView)
            
            
            // add subcontent
            let photo = UIImageView()
            photo.image = UIImage(named: nameAvatar)
            photo.frame = borderView.bounds
            borderView.addSubview(photo)
        }
   
        if let text = allMyNews[group] {
            cell.textNews.text = text
            
            //cell.likeCell.setup
        }
        return cell
    }
}
