//
//  ViewController.swift
//  VK
//
//  Created by ALEKSANDR KIRILENKOV on 15/12/2018.
//  Copyright © 2018 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

class LoginFormController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: LoginTextField!
    @IBOutlet weak var passwordInput: LoginTextField!
    @IBOutlet weak var warningLabel:  UILabel!
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hideKeybord() {
        self.scrollView?.endEditing(true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //Жест нажатия
        let hideKeybordGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeybord))
        //Присваиваем его  UIScrollView
        scrollView?.addGestureRecognizer(hideKeybordGesture)

    }
    //Перезаписываем функию управления переходом
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard  identifier == "ShowTabBarController"  else { return false }
        let checkResult = checkUsersData()
        if !checkResult {
            print("Error")
        }
        return checkResult
    }
    
    
    
    
    //Функция проверки польователя и пароля
    func checkUsersData() -> Bool {
        guard let login = loginInput.text, let password = passwordInput.text else {return false}
        if login == "Admin" && password == "12345" {
            warningLabel.textColor = .black
            warningLabel.text = "loading please wait..."
            return true
        } else {
            warningLabel.textColor = .red
            warningLabel.text = "password or login incorrect"
        return false
    }
    }
    

    @IBAction func loginButtonAction(_ sender: Any) {
        
//      checkUsersData()
//
//        let login = loginInput.text!
//        let password = passwordInput.text!
//
//        if login == "Admin" &&  password == "12345" {
//            warningLabel.textColor = .black
//            warningLabel.text = "loading please wait..."
//        } else {
//            warningLabel.textColor = .red
//            warningLabel.text = "password or login incorrect"
       }
 
    
    @IBAction func regButtonAction(_ sender: Any) {
    }
    @IBAction func forgotPasButtonAction(_ sender: Any) {
    }
    
}

