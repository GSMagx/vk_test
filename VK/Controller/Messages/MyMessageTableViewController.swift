//
//  MyMessageTableViewController.swift
//  VK
//
//  Created by ALEKSANDR KIRILENKOV on 10/01/2019.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

class MyMessageTableViewController: UITableViewController {
    
    
    var myFriend = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myFriend.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendCell", for: indexPath) as! TableViewCellMyMessage
        
        let myFriends = myFriend[indexPath.row]
        
        cell.myFriendName.text = myFriends

        return cell
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
   
    @IBAction func addFriend(unwindSeque: UIStoryboardSegue) {
        
    //    if unwindSeque.identifier == "addFriend" {
   //     let allMessageController = unwindSeque.source as! AllMessageTabelViewController

           // if  let indexPath = allMessageController.tableView.indexPathForSelectedRow {
             //   let friend = allMessageController.message[indexPath.row]

              //  myFriend.append(friend)

                tableView.reloadData()
         
                
        //    }
  //      }


}

   
}

