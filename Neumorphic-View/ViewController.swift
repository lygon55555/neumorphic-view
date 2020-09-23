//
//  ViewController.swift
//  Neumorphic-View
//
//  Created by Yonghyun on 2020/09/23.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // IBDesignable로 구현하기
    // 방향 설정도 가능하게
    // https://neumorphism.io/#708fc2
    
    
    
    @IBOutlet var squareView: UIView!
    
    let viewColor = UIColor(rgb: 0x708fc2)
    let shadowColor0 = UIColor(rgb: 0x536a90)
    let shadowColor1 = UIColor(rgb: 0x8db4f4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = viewColor
        squareView.backgroundColor = viewColor
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        shadowTest()
//        figma()
    }
    
    
    
    
    func shadowTest() {
        let shadowPath0 = UIBezierPath(roundedRect: squareView.bounds, cornerRadius: 30)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(rgb: 0x536a90).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 36
        layer0.shadowOffset = CGSize(width: 18, height: 18)
        layer0.frame = squareView.bounds
        squareView.layer.addSublayer(layer0)
//        squareView.layer.insertSublayer(layer0, at: 2)

        let shadowPath1 = UIBezierPath(roundedRect: squareView.bounds, cornerRadius: 30)
        let layer1 = CALayer()
        layer1.shadowPath = shadowPath1.cgPath
        layer1.shadowColor = UIColor(rgb: 0x8db4f4).cgColor
        layer1.shadowOpacity = 1
        layer1.shadowRadius = 36
        layer1.shadowOffset = CGSize(width: -18, height: -18)
        layer1.frame = squareView.bounds
        squareView.layer.addSublayer(layer1)
//        squareView.layer.insertSublayer(layer1, at: 1)
        
        let layer2 = CALayer()
        layer2.cornerRadius = 30
        layer2.backgroundColor = viewColor.cgColor
        layer2.frame = squareView.bounds
        squareView.layer.addSublayer(layer2)
//        squareView.layer.insertSublayer(layer2, at: 3)
        
//        let shapes = UIView()
//        shapes.frame = squareView.bounds
//        shapes.layer.cornerRadius = 30
//        shapes.backgroundColor = .red
//        shapes.clipsToBounds = false
//        squareView.addSubview(shapes)
        
//        let layer2 = CALayer()
//        layer2.backgroundColor = UIColor(red: 0.439, green: 0.561, blue: 0.761, alpha: 1).cgColor
//        shapes.layer.addSublayer(layer2)
//        shapes.layer.insertSublayer(layer2, at: 0)
//        shapes.layer.cornerRadius = 30
    }
    
    
    func test() {
        let testView = UIView()
        testView.frame = squareView.frame
        testView.backgroundColor = .red
        
        let shadows = UIView()
        shadows.frame = squareView.frame
        shadows.clipsToBounds = false
        squareView.addSubview(shadows)


        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 30)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0.325, green: 0.416, blue: 0.565, alpha: 1).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 36
        layer0.shadowOffset = CGSize(width: 18, height: 18)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)


        let shadowPath1 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 30)
        let layer1 = CALayer()
        layer1.shadowPath = shadowPath1.cgPath
        layer1.shadowColor = UIColor(red: 0.553, green: 0.706, blue: 0.957, alpha: 1).cgColor
        layer1.shadowOpacity = 1
        layer1.shadowRadius = 36
        layer1.shadowOffset = CGSize(width: -18, height: -18)
        layer1.bounds = shadows.bounds
        layer1.position = shadows.center
        shadows.layer.addSublayer(layer1)


        let shapes = UIView()
        shapes.frame = squareView.frame
        shapes.clipsToBounds = true
        squareView.addSubview(shapes)


        let layer2 = CALayer()
        layer2.backgroundColor = UIColor(red: 0.439, green: 0.561, blue: 0.761, alpha: 1).cgColor
        layer2.bounds = shapes.bounds
        layer2.position = shapes.center
        shapes.layer.addSublayer(layer2)
        shapes.layer.cornerRadius = 30
        
        squareView.addSubview(testView)

        
//        var parent = self.view!
//        parent.addSubview(view1)
//        view1.translatesAutoresizingMaskIntoConstraints = false
//        view1.widthAnchor.constraint(equalToConstant: 178).isActive = true
//        view1.heightAnchor.constraint(equalToConstant: 257).isActive = true
//        view1.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 71).isActive = true
//        view1.topAnchor.constraint(equalTo: parent.topAnchor, constant: 65).isActive = true
    }
    
    func figma() {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 178, height: 178)
        view.backgroundColor = viewColor


        let shadows = UIView()
        shadows.frame = view.frame
        shadows.clipsToBounds = false
        view.addSubview(shadows)


        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 30)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0.325, green: 0.416, blue: 0.565, alpha: 1).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 36
        layer0.shadowOffset = CGSize(width: 18, height: 18)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)


        let shadowPath1 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 30)
        let layer1 = CALayer()
        layer1.shadowPath = shadowPath1.cgPath
        layer1.shadowColor = UIColor(red: 0.553, green: 0.706, blue: 0.957, alpha: 1).cgColor
        layer1.shadowOpacity = 1
        layer1.shadowRadius = 36
        layer1.shadowOffset = CGSize(width: -18, height: -18)
        layer1.bounds = shadows.bounds
        layer1.position = shadows.center
        shadows.layer.addSublayer(layer1)


        let shapes = UIView()
        shapes.frame = view.frame
        shapes.clipsToBounds = true
        view.addSubview(shapes)


        let layer2 = CALayer()
        layer2.backgroundColor = UIColor(red: 0.439, green: 0.561, blue: 0.761, alpha: 1).cgColor
        layer2.bounds = shapes.bounds
        layer2.position = shapes.center
        shapes.layer.addSublayer(layer2)
        shapes.layer.cornerRadius = 30


        let parent = self.view!
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 178).isActive = true
        view.heightAnchor.constraint(equalToConstant: 257).isActive = true
        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 71).isActive = true
        view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 65).isActive = true
    }
}

extension CALayer {
    func applySketchShadow(color: UIColor = .black, alpha: Float = 0.5, x: CGFloat = 0, y: CGFloat = 2, blur: CGFloat = 4, spread: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        
        if spread == 0 {
            shadowPath = nil
        }
        else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
        masksToBounds = false
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
