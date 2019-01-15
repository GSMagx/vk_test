//
//  FriendsTableViewController.swift
//  VK
//
//  Created by ALEKSANDR KIRILENKOV on 12/01/2019.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

class MyFriendsController: UITableViewController {
    
    var fotoDelegate = [String]()
    
    var myFriends = ["Vladimir Putin",
                     "Maxim Galkin",
                     "Boris Elzin",
                     "Aleksey Navalniy",
                     "Genadiy Suganov"
    ]

    var fotoMyFriends = [
        "Vladimir Putin"    :["Putin_1", "Putin_2", "Putin_3", "putin"],
        "Maxim Galkin"      :["Galkin_1", "Galkin_2", "Galkin_3", "galkin"],
        "Boris Elzin"       :["Elzin_1", "Elzin_2", "Elzin_3","elzin"],
        "Aleksey Navalniy"  :["Navalniy_1", "Navalniy_2", "Navalniy_3", "navalniy"],
        "Genadiy Suganov"   :["Suganov_1", "Suganov_2", "Suganov_3", "suganov"]
    ]
    
    var characters : [String] = ["A", "B", "G", "M","V"]
    var myFriendsCharacter = ["Vladimir Putin", "Maxim Galkin", "Boris Elzin", "Aleksey Navalniy", "Genadiy Suganov"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return characters.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myFriendsCharacter = myFriends.filter{$0[$0.startIndex] == Character(characters[section])
        }
            
        return myFriendsCharacter.count
    }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        myFriendsCharacter = myFriends.filter{$0[$0.startIndex] == Character(characters[indexPath.section])
        }
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! MyFriendsCell
        let friend = myFriendsCharacter[indexPath.row]
        cell.friendName.text = friend
        
            if let nameAvatar = fotoMyFriends[friend]?.last {
                cell.fotoFriend.backgroundColor = UIColor.white
                cell.fotoFriend.layer.shadowColor = UIColor.black.cgColor
                cell.fotoFriend.layer.cornerRadius = 20
                cell.fotoFriend.layer.shadowOffset = cell.shadowOffset
                cell.fotoFriend.layer.shadowOpacity = cell.shadowOpacity
                cell.fotoFriend.layer.shadowRadius = cell.shadowRadius
                cell.fotoFriend.layer.masksToBounds = false
                
                
                //add subview
                
                let borderView = UIView(frame: cell.fotoFriend.bounds)
                borderView.frame = cell.fotoFriend.bounds
                borderView.layer.cornerRadius = 20
                borderView.layer.masksToBounds = true
                cell.fotoFriend.addSubview(borderView)
                
                //add subcontent
                let photo = UIImageView()
                photo.image = UIImage(named: nameAvatar)
                photo.frame = borderView.bounds
                borderView.addSubview(photo)
 
            }
        return cell
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return characters
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(characters[section])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "allFotoFriend" {
            let fotoFriendsController = segue.destination as! FotoFriendCollectionController
            let myFriendsController = segue.source as! MyFriendsController
             //  Получаем индекс выделенной ячейки
            if let indexPath = myFriendsController.tableView.indexPathForSelectedRow {
                myFriendsCharacter = myFriends.filter {$0[$0.startIndex] == Character(characters[indexPath.section]) }
                // Получаем друга по индексу
                let friend = myFriendsController.myFriendsCharacter[indexPath.row]
                if let fotoDelegate = myFriendsController.fotoMyFriends[friend] {
                  fotoFriendsController.fotoDelegate = fotoDelegate
                    fotoFriendsController.text = myFriends[indexPath.row]
                    
                    
                }
            }
        }
    }

//    ["A", "B", "C", "D", "E", "F", "G", "H", "I",
//    "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S",
//    "T", "U", "V", "W", "X", "Y", "Z"
//    ]
}
