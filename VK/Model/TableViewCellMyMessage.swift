//
//  TableViewCellMyMessage.swift
//  VK
//
//  Created by ALEKSANDR KIRILENKOV on 10/01/2019.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

class TableViewCellMyMessage: UITableViewCell {
    
   
    @IBOutlet weak var myFriendName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
