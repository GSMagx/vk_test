//
//  AllGroupsCell.swift
//  VK
//
//  Created by ALEKSANDR KIRILENKOV on 14/01/2019.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

@IBDesignable class AllGroupsCell: UITableViewCell {
    @IBOutlet weak var allGroupsImage: UIImageView!
    
    @IBOutlet weak var allGroupsName: UILabel!
    
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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}
