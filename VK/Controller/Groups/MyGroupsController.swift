//
//  MyGroupsController.swift
//  VK
//
//  Created by ALEKSANDR KIRILENKOV on 14/01/2019.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

class MyGroupsController: UITableViewController {

    var myGroups = [String]()
    var myGroupsFoto = [
        "Swift Programming" :"Swift Programming",
        "X-Plane 11"        :"X-Plane 11",
        "Hacking"           :"Hacking",
        "English"           :"English"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsCell", for: indexPath) as! MyGroupsCell
        let group = myGroups[indexPath.row]
            cell.myGroupsName.text = group
        
        if let nameAvatar = myGroupsFoto[group] {
            cell.myGroupsImage.backgroundColor = UIColor.clear
            cell.myGroupsImage.layer.shadowColor = UIColor.black.cgColor
            cell.myGroupsImage.layer.shadowOffset = cell.shadowOffset
            cell.myGroupsImage.layer.shadowOpacity = cell.shadowOpacity
            cell.myGroupsImage.layer.shadowRadius = cell.shadowRadius
            cell.myGroupsImage.layer.masksToBounds = false
            
            // add subview
            let borderView = UIView(frame: cell.myGroupsImage.bounds)
            borderView.frame = cell.myGroupsImage.bounds
            borderView.layer.cornerRadius = 20
            
            borderView.layer.masksToBounds = true
            cell.myGroupsImage.addSubview(borderView)
            
            // add subcontent
            let photo = UIImageView()
            photo.image = UIImage(named: nameAvatar)
            photo.frame = borderView.bounds
            borderView.addSubview(photo)
        
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        
        // Проверяем идентификатор, чтобы убедится, что это нужный переход
        if segue.identifier == "addGroup" {
            
            // Получаем ссылку на контроллер, с которого осуществлен переход
            let allGroupsController = segue.source as! AllGroupsController
            // Получаем группу по индексу
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
                
                let group = allGroupsController.allGroups[indexPath.row]
                let groupFoto = allGroupsController.allGroupsFoto[group]
                
                UIView.transition(with: self.view, duration: 0.5 , options: .transitionFlipFromBottom, animations: {
                }, completion: nil)
                
                // прверяем нет ли выбранных повторных групп
                if !myGroups.contains(group) {
                    myGroups.append(group)
                    tableView.reloadData()
                    myGroupsFoto[group] = groupFoto
                    tableView.reloadData()
                }
            }
            
        }
        
    }



}
