//
//  LoginTextField.swift
//  VK
//
//  Created by ALEKSANDR KIRILENKOV on 15/12/2018.
//  Copyright © 2018 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

@IBDesignable

class LoginTextField: UITextField {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderColor = UIColor(white: 231 / 255, alpha: 1).cgColor
        self.layer.borderWidth = 1
        
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 5, dy: 7)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
}
