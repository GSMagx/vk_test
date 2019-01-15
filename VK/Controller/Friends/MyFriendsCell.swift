//
//  FriendsCell.swift
//  VK
//
//  Created by ALEKSANDR KIRILENKOV on 12/01/2019.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

@IBDesignable class MyFriendsCell: UITableViewCell {
    
    @IBOutlet var allFoto: [MyFriendsCell]!

    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var fotoFriend: UIImageView!
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 3, height: 3)
        
    /// Прозрачность тени
    @IBInspectable var shadowOpacity: Float = 0.8
    
    /// Радиус блура тени
    @IBInspectable var shadowRadius: CGFloat = 10
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
