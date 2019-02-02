//
//  ViewController.swift
//  VK
//
//  Created by ALEKSANDR KIRILENKOV on 15/12/2018.
//  Copyright © 2018 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit
import Lottie


class LoginFormController: UIViewController {
    @IBOutlet weak var animationLoader: LOTAnimationView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: LoginTextField!
    @IBOutlet weak var passwordInput: LoginTextField!
    @IBOutlet weak var loginTitle: UILabel!
    @IBOutlet weak var logoView: UIImageView!
    
    
    
    
    @IBOutlet weak var passwordTitle: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    // @IBOutlet weak var warningLabel:  UILabel!

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
        
        
        animationLoader.setAnimation(named: "loader")
        animationLoader.loopAnimation = true
        animationLoader.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 250)
        animationLoader.animationSpeed = 0.8
    
        animationLoader.play()
      
        
        animateLoginField()
        animatePasswordField()
        
        animateAuthButton()
        
        //Жест нажатия
        let hideKeybordGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeybord))
        //Присваиваем его  UIScrollView
        scrollView?.addGestureRecognizer(hideKeybordGesture)
    }
    //Перезаписываем функию управления переходом
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard  identifier == "ShowTabBarController"  else { return false }
        let checkResult = checkUsersData()
        animationSeque()
        
        if !checkResult {
            print("Error")
        }
        return checkResult
    }
    //Функция проверки польователя и пароля
    func checkUsersData() -> Bool {
        guard let login = loginInput.text, let password = passwordInput.text else {return false}
        if login == "Admin" && password == "12345" {
            
            return true
        } else {
        showLoginError()
        return false
    }
    }
    func showLoginError() {
        let alert = UIAlertController(title: "Error", message: "Wrong Password or login", preferredStyle: .alert)
    
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        present(alert, animated: true, completion: nil)
        alert.addAction(alertAction)

    }

    @IBAction func loginButtonAction(_ sender: Any) {
        
        
        
//        UIView.transition(with: self.view, duration: 0.5, options: .transitionFlipFromBottom, animations: {
//        //    self.view.addSubview(self.imageView)
//        }, completion: nil)
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
    @IBAction func enterPressedKeyboardlogin(_ sender: Any) {
        performSegue(withIdentifier: "ShowTabBarController", sender: checkUsersData())
    }
    @IBAction func enterPressedKeyboardPass(_ sender: Any) {
        performSegue(withIdentifier: "ShowTabBarController", sender: checkUsersData())
    }
    
//    func animateTitleAppearing() {
//        self.titleView.transform = CGAffineTransform(translationX: 0,
//                                                     y: -self.view.bounds.height/2)
//
//        UIView.animate(withDuration: 1,
//                       delay: 1,
//                       usingSpringWithDamping: 0.5,
//                       initialSpringVelocity: 0,
//                       options: .curveEaseOut,
//                       animations: {
//                        self.titleView.transform = .identity
//        },
//                       completion: nil)
//    }
    
    
    func animateAuthButton() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 1
        animation.duration = 1
        animation.beginTime = CACurrentMediaTime() + 1
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        
        self.loginButton.layer.add(animation, forKey: nil)
    }
        
        func animateLoginField() {
            let animation = CASpringAnimation(keyPath: "transform.scale")
            animation.fromValue = 0
            animation.toValue = 1
            animation.stiffness = 100
            animation.mass = 2
            animation.duration = 1
            animation.beginTime = CACurrentMediaTime() + 1
            animation.fillMode = CAMediaTimingFillMode.backwards
            
            
            self.loginInput.layer.add(animation, forKey: nil)
        }
            func animatePasswordField() {
                let animation = CASpringAnimation(keyPath: "transform.scale")
                animation.fromValue = 0
                animation.toValue = 1
                animation.stiffness = 200
                animation.mass = 2
                animation.duration = 2
                animation.beginTime = CACurrentMediaTime() + 1
                animation.fillMode = CAMediaTimingFillMode.backwards
                
                
                self.passwordInput.layer.add(animation, forKey: nil)
                
                
     //   self.loginInput.layer.add(animation, forKey: nil)
     //   self.passwordInput.layer.add(animation, forKey: nil)
    }
    
    func animationSeque() {
        UIView.transition(with: self.view, duration: 0.5 , options: .transitionCurlUp, animations: {
        }, completion: nil)
    }
//    func animateFieldsAppearing() {
//        let fadeInAnimation = CABasicAnimation(keyPath: "opacity")
//        fadeInAnimation.fromValue = 0
//        fadeInAnimation.toValue = 1
//        fadeInAnimation.duration = 1
//        fadeInAnimation.beginTime = CACurrentMediaTime() + 1
//        fadeInAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
//        fadeInAnimation.fillMode = CAMediaTimingFillMode.backwards
//
//        self.loginInput.layer.add(fadeInAnimation, forKey: nil)
//
//    }


  //  @IBAction func regButtonAction(_ sender: Any) {
   // }
  //  @IBAction func forgotPasButtonAction(_ sender: Any) {
    //

}
