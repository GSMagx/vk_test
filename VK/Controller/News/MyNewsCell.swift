//
//  NewsCell.swift
//  VK
//
//  Created by Alex on 15.01.19.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

class MyNewsCell: UITableViewCell {
    
    @IBOutlet weak var textNews: UILabel!
    @IBOutlet weak var groupNewsFoto: UIImageView!
    @IBOutlet weak var groupNewsName: UILabel!
    @IBOutlet weak var LikeCell: LikeControl!
    
    
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
        
        // Configure the view for the selected state
    }


}
