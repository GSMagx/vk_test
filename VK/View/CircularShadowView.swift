//
//  CircularShadowView.swift
//  VK
//
//  Created by Alex on 24.01.19.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CircularShadowView: UIImageView {
    
    @IBInspectable var shadowColor: UIColor = .black
    @IBInspectable var shadowOffset: CGSize = .zero
    /// Прозрачность тени
    @IBInspectable var shadowOpacity: Float = 0.5
    /// Радиус блура тени
    @IBInspectable var shadowRadius: CGFloat = 8
    
    var cornerRadius: CGFloat {
        return frame.width / 2
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        setCornerRadius(calue: cornerRadius)
        setShadow()
    }
    
    func setCornerRadius(calue: CGFloat) {
        layer.cornerRadius = calue
    }
    
    func setShadow() {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
        layer.masksToBounds = false
    }
    
}
