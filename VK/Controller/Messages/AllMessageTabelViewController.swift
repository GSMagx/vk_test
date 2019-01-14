//
//  MessageTabelViewController.swift
//  VK
//
//  Created by ALEKSANDR KIRILENKOV on 10/01/2019.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

class AllMessageTabelViewController: UITableViewController {
    
    var friends = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! TableViewCellAllMessage
        
        let friend = friends[indexPath.row]
        
        cell.friendName.text = friend

        return cell
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
 

   
//    
//    @IBAction func addFriend(unwindSeque: UIStoryboardSegue) {
//        
//        if unwindSeque.identifier == "addFriend" {
//            
//            let allMessageController = unwindSeque.source as! AllMessageTabelViewController
//            if  let indexPath = allMessageController.tableView.indexPathForSelectedRow {
//                let friend = allMessageController.friends[indexPath.row]
//                
//                addFriend.append(friend)
//                
//                tableView.reloadData()
//            }
//        }
//        
//        
//    }

}
