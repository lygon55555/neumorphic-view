//
//  NeumorphicView.swift
//  Neumorphic-View
//
//  Created by Yonghyun on 2020/09/24.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class NeumorphicView: UIView {
    var shadowPath0: UIBezierPath?
    var shadowPath1: UIBezierPath?
    var layer0: CALayer = CALayer()
    var layer1: CALayer = CALayer()
    var layer2: CALayer = CALayer()
    var gradientLayer: CAGradientLayer?
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer2.cornerRadius = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer0.shadowOpacity
        }
        set {
            layer0.shadowOpacity = newValue
            layer1.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer0.shadowRadius*2
        }
        set {
            layer0.shadowRadius = newValue/2
            layer1.shadowRadius = newValue/2
        }
    }
    
    @IBInspectable var shadowOffset: CGFloat {
        get {
            return layer0.shadowOffset.width
        }
        set {
            layer0.shadowOffset = CGSize(width: newValue, height: newValue)
            layer1.shadowOffset = CGSize(width: -newValue, height: -newValue)
        }
    }
    
    override var backgroundColor: UIColor? {
        didSet {
            layer2.backgroundColor = self.backgroundColor?.cgColor
        }
    }
    
    fileprivate func setup() {
        shadowPath0 = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius)
        layer0.frame = self.bounds
        layer0.shadowPath = shadowPath0?.cgPath
        self.layer.addSublayer(layer0)
        
        shadowPath1 = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius)
        layer1.frame = self.bounds
        layer1.shadowPath = shadowPath1?.cgPath
        self.layer.addSublayer(layer1)
        
        layer2.frame = self.bounds
        self.layer.addSublayer(layer2)
        
        layer0.shadowColor = UIColor(rgb: 0x4a5e80).cgColor
        layer1.shadowColor = UIColor(rgb: 0x96c0ff).cgColor
    }
    
    override func layoutSubviews() {
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
}
