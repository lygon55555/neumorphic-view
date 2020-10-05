//
//  ViewController.swift
//  Neumorphic-View
//
//  Created by Yonghyun on 2020/09/23.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 방향 설정도 가능하게
    // https://neumorphism.io/#708fc2
    
    
    
    @IBOutlet var squareView: UIView!
    
    var viewColor = UIColor(rgb: 0x708fc2)
    let shadowColor0 = UIColor(rgb: 0x536a90)
    let shadowColor1 = UIColor(rgb: 0x8db4f4)
    var value: Float = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.view.backgroundColor = viewColor
        squareView.backgroundColor = viewColor
        squareView.layer.cornerRadius = 30
        
//        shape0()
        shape1()
//        shape2()
//        shape3()
    }
    
    func shape0() {
        let shadowPath0 = UIBezierPath(roundedRect: squareView.bounds, cornerRadius: 30)
        let layer0 = CALayer()
        layer0.frame = squareView.bounds
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(rgb: 0x4a5e80).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 36/2
        layer0.shadowOffset = CGSize(width: 18, height: 18)
        squareView.layer.addSublayer(layer0)
        
        let shadowPath1 = UIBezierPath(roundedRect: squareView.bounds, cornerRadius: 30)
        let layer1 = CALayer()
        layer1.frame = squareView.bounds
        layer1.shadowPath = shadowPath1.cgPath
        layer1.shadowColor = UIColor(rgb: 0x96c0ff).cgColor
        layer1.shadowOpacity = 1
        layer1.shadowRadius = 36/2
        layer1.shadowOffset = CGSize(width: -18, height: -18)
        squareView.layer.addSublayer(layer1)
        
        let layer2 = CALayer()
        layer2.frame = squareView.bounds
        layer2.cornerRadius = 30
        layer2.backgroundColor = viewColor.cgColor
        squareView.layer.addSublayer(layer2)
    }
    
    func shape1() {
        let shadowPath0 = UIBezierPath(roundedRect: squareView.bounds, cornerRadius: 30)
        let layer0 = CALayer()
        layer0.frame = squareView.bounds
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(rgb: 0x4a5e80).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 36/2
        layer0.shadowOffset = CGSize(width: 18, height: 18)
        squareView.layer.addSublayer(layer0)
        
        let shadowPath1 = UIBezierPath(roundedRect: squareView.bounds, cornerRadius: 30)
        let layer1 = CALayer()
        layer1.frame = squareView.bounds
        layer1.shadowPath = shadowPath1.cgPath
        layer1.shadowColor = UIColor(rgb: 0x96c0ff).cgColor
        layer1.shadowOpacity = 1
        layer1.shadowRadius = 36/2
        layer1.shadowOffset = CGSize(width: -18, height: -18)
        squareView.layer.addSublayer(layer1)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.cornerRadius = 30
        gradientLayer.frame = squareView.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.colors = [
            UIColor(rgb: 0x7b95bc).cgColor,
            UIColor(rgb: 0x93b1e0).cgColor
        ]
        gradientLayer.locations = [0, 1]
        squareView.layer.addSublayer(gradientLayer)
    }
    
    func shape2() {
        let shadowPath0 = UIBezierPath(roundedRect: squareView.bounds, cornerRadius: 30)
        let layer0 = CALayer()
        layer0.frame = squareView.bounds
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(rgb: 0x4a5e80).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 36/2
        layer0.shadowOffset = CGSize(width: 18, height: 18)
        squareView.layer.addSublayer(layer0)

        let shadowPath1 = UIBezierPath(roundedRect: squareView.bounds, cornerRadius: 30)
        let layer1 = CALayer()
        layer1.frame = squareView.bounds
        layer1.shadowPath = shadowPath1.cgPath
        layer1.shadowColor = UIColor(rgb: 0x96c0ff).cgColor
        layer1.shadowOpacity = 1
        layer1.shadowRadius = 36/2
        layer1.shadowOffset = CGSize(width: -18, height: -18)
        squareView.layer.addSublayer(layer1)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.cornerRadius = 30
        gradientLayer.frame = squareView.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.colors = [
            UIColor(rgb: 0x93b1e0).cgColor,
            UIColor(rgb: 0x7b95bc).cgColor
        ]
        gradientLayer.locations = [0, 1]
        squareView.layer.addSublayer(gradientLayer)
    }
    
    func shape3() {
        squareView.addInnerShadow(onSide: .topAndLeft, shadowColor: UIColor(rgb: 0x4a5e80).cgColor, shadowSize: 36, cornerRadius: 30, shadowOpacity: 1)
        squareView.addInnerShadow(onSide: .bottomAndRight, shadowColor: UIColor(rgb: 0x96c0ff).cgColor, shadowSize: 36, cornerRadius: 30, shadowOpacity: 1)
    }
}
