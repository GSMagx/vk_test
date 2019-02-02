//
//  RegisterViewController.swift
//  VK
//
//  Created by Alex on 31.01.19.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var buttonSlider: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addPhotoButton.layer.cornerRadius = 40
        buttonSlider.layer.cornerRadius = 10
        
    }
    

   

}
