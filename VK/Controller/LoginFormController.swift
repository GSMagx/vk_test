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
    
    @objc func keybordWasShow(notification: Notification) {
        //получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue ).cgRectValue.size
        let contentinsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
    
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentinsets
        scrollView?.scrollIndicatorInsets = contentinsets
}
        //Когда клавиатура исчезает
    @objc func keybordWillBeHidden(notification: Notification) {
        //Устанавливаем отступ внизу UIScroll View, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
    
        //Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keybordWasShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        //Второк - когда она пропадет
        NotificationCenter.default.addObserver(self, selector: #selector(self.keybordWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
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

