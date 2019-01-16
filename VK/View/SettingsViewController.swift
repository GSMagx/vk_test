//
//  SettingsViewController.swift
//  VK
//
//  Created by Alex on 16.01.19.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var labelSetting: UILabel!
    @IBOutlet weak var backgroundColorText: UILabel!
    @IBOutlet weak var toggelBackground: UISwitch!
    @IBOutlet weak var subView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func toggelActionColorBackground(_ sender: Any) {
        
        if toggelBackground.isOn {
            subView.isHidden = false
            view.backgroundColor = .black
            labelSetting.textColor = .white
            backgroundColorText.textColor = .white
           
        } else {
            subView.isHidden = true
            view.backgroundColor = .white
            labelSetting.textColor = .black
            backgroundColorText.textColor = .black
         
        }
        
    }
    
   

}
