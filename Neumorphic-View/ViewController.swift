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
    @IBOutlet var intensitySlider: UISlider!
    
    var viewColor = UIColor(rgb: 0x708fc2)
    let shadowColor0 = UIColor(rgb: 0x536a90)
    let shadowColor1 = UIColor(rgb: 0x8db4f4)
    var value: Float = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        intensitySlider.isHidden = true
        
        self.view.backgroundColor = viewColor
        squareView.backgroundColor = viewColor
        squareView.layer.cornerRadius = 30
        
//        shape0()
//        shape1()
//        shape2()
        shape3()
//        figma()
    }
    
    @IBAction func changeIntensity(_ sender: UISlider) {
        if value < intensitySlider.value {
            value = intensitySlider.value
            viewColor = viewColor.darker(by: CGFloat(value*10))
            self.view.backgroundColor = viewColor
        }
        else {
            value = intensitySlider.value
            viewColor = viewColor.lighter(by: CGFloat(value*10))
            self.view.backgroundColor = viewColor
        }
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
        squareView.addInnerShadow(onSide: .topAndLeft, shadowColor: UIColor(rgb: 0x4a5e80), shadowSize: 36, cornerRadius: 30, shadowOpacity: 1)
        squareView.addInnerShadow(onSide: .bottomAndRight, shadowColor: UIColor(rgb: 0x96c0ff), shadowSize: 36, cornerRadius: 30, shadowOpacity: 1)
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

extension UIColor {
    func lighter(by percentage: CGFloat = 10.0) -> UIColor {
        return self.adjust(by: abs(percentage))
    }

    func darker(by percentage: CGFloat = 10.0) -> UIColor {
        return self.adjust(by: -abs(percentage))
    }

    func adjust(by percentage: CGFloat) -> UIColor {
        var alpha, hue, saturation, brightness, red, green, blue, white : CGFloat
        (alpha, hue, saturation, brightness, red, green, blue, white) = (0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)

        let multiplier = percentage / 100.0

        if self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            let newBrightness: CGFloat = max(min(brightness + multiplier*brightness, 1.0), 0.0)
            return UIColor(hue: hue, saturation: saturation, brightness: newBrightness, alpha: alpha)
        }
        else if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            let newRed: CGFloat = min(max(red + multiplier*red, 0.0), 1.0)
            let newGreen: CGFloat = min(max(green + multiplier*green, 0.0), 1.0)
            let newBlue: CGFloat = min(max(blue + multiplier*blue, 0.0), 1.0)
            return UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: alpha)
        }
        else if self.getWhite(&white, alpha: &alpha) {
            let newWhite: CGFloat = (white + multiplier*white)
            return UIColor(white: newWhite, alpha: alpha)
        }

        return self
    }
}


extension UIView
{
    // different inner shadow styles
    public enum innerShadowSide
    {
        case all, left, right, top, bottom, topAndLeft, topAndRight, bottomAndLeft, bottomAndRight, exceptLeft, exceptRight, exceptTop, exceptBottom
    }
    
    // define function to add inner shadow
    public func addInnerShadow(onSide: innerShadowSide, shadowColor: UIColor, shadowSize: CGFloat, cornerRadius: CGFloat = 0.0, shadowOpacity: Float)
    {
        // define and set a shaow layer
        let shadowLayer = CAShapeLayer()
        shadowLayer.frame = bounds
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowRadius = shadowSize
        shadowLayer.fillRule = CAShapeLayerFillRule.evenOdd
        
        // define shadow path
        let shadowPath = CGMutablePath()
        
        // define outer rectangle to restrict drawing area
        let insetRect = bounds.insetBy(dx: -shadowSize * 2.0, dy: -shadowSize * 2.0)
        
        // define inner rectangle for mask
        let innerFrame: CGRect = { () -> CGRect in
            switch onSide
            {
                case .all:
                    return CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height)
                case .left:
                    return CGRect(x: 0.0, y: -shadowSize * 2.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height + shadowSize * 4.0)
                case .right:
                    return CGRect(x: -shadowSize * 2.0, y: -shadowSize * 2.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height + shadowSize * 4.0)
                case .top:
                    return CGRect(x: -shadowSize * 2.0, y: 0.0, width: frame.size.width + shadowSize * 4.0, height: frame.size.height + shadowSize * 2.0)
                case.bottom:
                    return CGRect(x: -shadowSize * 2.0, y: -shadowSize * 2.0, width: frame.size.width + shadowSize * 4.0, height: frame.size.height + shadowSize * 2.0)
                case .topAndLeft:
                    return CGRect(x: 0.0, y: 0.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height + shadowSize * 2.0)
                case .topAndRight:
                    return CGRect(x: -shadowSize * 2.0, y: 0.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height + shadowSize * 2.0)
                case .bottomAndLeft:
                    return CGRect(x: 0.0, y: -shadowSize * 2.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height + shadowSize * 2.0)
                case .bottomAndRight:
                    return CGRect(x: -shadowSize * 2.0, y: -shadowSize * 2.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height + shadowSize * 2.0)
                case .exceptLeft:
                    return CGRect(x: -shadowSize * 2.0, y: 0.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height)
                case .exceptRight:
                    return CGRect(x: 0.0, y: 0.0, width: frame.size.width + shadowSize * 2.0, height: frame.size.height)
                case .exceptTop:
                    return CGRect(x: 0.0, y: -shadowSize * 2.0, width: frame.size.width, height: frame.size.height + shadowSize * 2.0)
                case .exceptBottom:
                    return CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height + shadowSize * 2.0)
            }
        }()
        
        // add outer and inner rectangle to shadow path
        shadowPath.addRect(insetRect)
        shadowPath.addRect(innerFrame)
        
        // set shadow path as show layer's
        shadowLayer.path = shadowPath
        
        // add shadow layer as a sublayer
        layer.addSublayer(shadowLayer)
        
        // hide outside drawing area
        clipsToBounds = true
    }
}
