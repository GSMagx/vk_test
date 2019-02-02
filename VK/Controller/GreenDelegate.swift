//
//  GreenDelegate.swift
//  VK
//
//  Created by Alex on 29.01.19.
//  Copyright © 2019 ALEKSANDR KIRILENKOV. All rights reserved.
//

import Foundation
import Lottie

class GreenDelegate: NSObject, LOTColorValueDelegate {
    
    func color(forFrame currentFrame: CGFloat, startKeyframe: CGFloat, endKeyframe: CGFloat, interpolatedProgress: CGFloat, start startColor: CGColor!, end endColor: CGColor!, currentColor interpolatedColor: CGColor!) -> Unmanaged<CGColor>! {
        return  Unmanaged.passRetained(UIColor.green.cgColor)
    }
}

