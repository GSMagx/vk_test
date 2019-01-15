//
//  LikeControl.swift
//  VK
//
//  Created by Alex on 15.01.19.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import UIKit

@IBDesignable class LikeControl: UIStackView {
    
    @IBInspectable var like = 45

    var likeActive = false
    var button = UIButton()
    var label = UILabel()
    
    class NewsGroup {
        var fotoGroup: String
        var textNews: String
        var nameGroup: String
        var like: Int
        var likeActive: Bool
        var button: UIButton?
        init(fotoGroup: String, textNews: String, nameGroup: String, like: Int, likeActive: Bool, button: UIButton?) {
            self.fotoGroup = fotoGroup
            self.textNews = textNews
            self.nameGroup = nameGroup
            self.like = like
            self.likeActive = likeActive
            self.button = button
        }

}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    func setupButtons()  {
        removeArrangedSubview(label)
        removeArrangedSubview(button)
        let bundle = Bundle(for: type(of: self))
        let filledHeart = UIImage(named: "like", in: bundle, compatibleWith: self.traitCollection)
        let emptyHeart = UIImage(named: "noLike", in: bundle, compatibleWith: self.traitCollection)
        label.text = String(like)
        addArrangedSubview(button)
        addArrangedSubview(label)
        label.leadingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
        label.topAnchor.constraint(equalTo: button.topAnchor, constant: 5.0).isActive = true
        if !likeActive {
            button.addTarget(self, action: #selector(LikeControl.likeButtonTapped(button:)), for: .touchUpInside)
            button.setImage(emptyHeart, for: .normal)
            button.setImage(filledHeart, for: .selected)
            label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        } else {
            button.addTarget(self, action: #selector(LikeControl.likeButtonTapped(button:)), for: .touchUpInside)
            button.setImage(filledHeart, for: .normal)
            button.setImage(emptyHeart, for: .selected)
            label.textColor = UIColor.red
        }

    }
    
    @objc func likeButtonTapped(button: UIButton) {
        //        guard let like = ratingMyNews[] else {
        //            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingMyNews)")
        print("Button pressed 👍")
        if !likeActive {
            likeActive = true
            like += 1
        } else {
            likeActive = false
            like -= 1
        }
        setupButtons()
    }
    
    
}
