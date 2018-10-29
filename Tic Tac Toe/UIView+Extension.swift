//
//  UIView+Extension.swift
//  Tic Tac Toe
//
//  Created by Jai Bhim on 10/28/18.
//  Copyright © 2018 Bhimanapati. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setGradientBgColor(colorOne: UIColor, colorTwo: UIColor, colorThree: UIColor, colorFour: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor, colorThree.cgColor, colorFour.cgColor]
        gradientLayer.locations = [0.0,0.25,0.75,1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
