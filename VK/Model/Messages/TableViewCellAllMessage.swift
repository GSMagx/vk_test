//
//  TableViewCellMessage.swift
//  VK
//
//  Created by ALEKSANDR KIRILENKOV on 10/01/2019.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

class TableViewCellAllMessage: UITableViewCell {

    @IBOutlet weak var messageUserName: UILabel!
    @IBOutlet weak var messageUserImage: UIImageView!
    @IBOutlet weak var messageDate: UILabel!
    @IBOutlet weak var messageText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
