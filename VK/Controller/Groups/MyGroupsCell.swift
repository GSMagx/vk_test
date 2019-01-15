//
//  MyGroupsCell.swift
//  VK
//
//  Created by ALEKSANDR KIRILENKOV on 14/01/2019.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

class MyGroupsCell: UITableViewCell {

    @IBOutlet weak var myGroupsImage: UIImageView!
    @IBOutlet weak var myGroupsName: UILabel!
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 3, height: 3)
 
    /// Прозрачность тени
    @IBInspectable var shadowOpacity: Float = 0.3
  
    /// Радиус блура тени
    @IBInspectable var shadowRadius: CGFloat = 10
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
