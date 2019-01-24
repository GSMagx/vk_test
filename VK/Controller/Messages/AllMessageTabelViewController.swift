//
//  MessageTabelViewController.swift
//  VK
//
//  Created by ALEKSANDR KIRILENKOV on 10/01/2019.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit



class AllMessageabelViewController: UITableViewController {
    
    var message = [String]()
    
//    var message : [String] = [
//        StructMessages(userName: "Vladimir Putin", textMessage: "Hi. I go to school at 7 o‘clock", photo: UIImage(named: "putin")!, date: "Today"),
//        StructMessages(userName: "Maxim Galkin", textMessage: "Please call me back", photo: UIImage(named: "galkin")!, date: "12.01.2019"),
//        StructMessages(userName: "Genadiy Suganov", textMessage: "Super Star", photo: UIImage(named: "suganov")!, date: "01.01.2019"),
//        StructMessages(userName: "Boris Elzin", textMessage: "I am a very poor man...", photo: UIImage(named: "elzin")!, date: "many years ago")
//
//    ]
    

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
        return message.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! TableViewCellAllMessage
        
       let messag = message[indexPath.row]
        
//        cell.messageUserName.text = messag.userName
//        cell.messageText.text = messag.textMessage
//        cell.messageDate.text = messag.date
//        cell.messageUserImage.image = messag.photo
    

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
