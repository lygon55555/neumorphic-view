# Neumorphic-View
1. Add NeumorphicView.swift to your project folder or copy the code below  
```swift
@IBDesignable
class NeumorphicView: UIView {
    
    enum ShapeType: Int {
        case Flat    = 0
        case Concave = 1
        case Convex  = 2
        case Pressed = 3
    }
    
    enum DirectionType: Int {
        case TopLeft = 0
        case TopRight = 1
        case BottomLeft = 2
        case BottomRight = 3
    }
    
    var shadowPath0: UIBezierPath?
    var shadowPath1: UIBezierPath?
    var shadowLayer0: CALayer = CALayer()
    var shadowLayer1: CALayer = CALayer()
    var topLayer: CALayer = CALayer()
    var gradientLayer: CAGradientLayer = CAGradientLayer()
    var shape: ShapeType = .Flat
    var direction: DirectionType = .TopLeft
    var shadowIntensity: CGFloat = 0
    var shadowColor0: UIColor?
    var shadowColor1: UIColor?
    var gradientColor0: UIColor?
    var gradientColor1: UIColor?
    
    @IBInspectable var shapeType: Int {
        get {
            return self.shape.rawValue
        }
        
        set(shapeIndex) {
            if shapeIndex < 0 || shapeIndex > 3 {
                self.shape = ShapeType.Flat
            }
            else {
                self.shape = ShapeType(rawValue: shapeIndex) ?? ShapeType.Flat
            }
        }
    }
    
    @IBInspectable var directionType: Int {
        get {
            return self.direction.rawValue
        }
        
        set(directionIndex) {
            if directionIndex < 0 || directionIndex > 3 {
                self.direction = DirectionType.TopLeft
            }
            else {
                self.direction = DirectionType(rawValue: directionIndex) ?? DirectionType.TopLeft
            }
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            topLayer.cornerRadius = newValue
            gradientLayer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var opacity: Float {
        get {
            return shadowLayer0.shadowOpacity
        }
        set {
            shadowLayer0.shadowOpacity = newValue
            shadowLayer1.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return shadowLayer0.shadowRadius*2
        }
        set {
            shadowLayer0.shadowRadius = newValue/2
            shadowLayer1.shadowRadius = newValue/2
        }
    }
    
    @IBInspectable var offset: CGFloat {
        get {
            return shadowLayer0.shadowOffset.width
        }
        set {
            switch(shape) {
            case .Flat, .Concave, .Convex:
                switch(direction) {
                case .TopLeft:
                    shadowLayer0.shadowOffset = CGSize(width: newValue, height: newValue)
                    shadowLayer1.shadowOffset = CGSize(width: -newValue, height: -newValue)
                case .TopRight:
                    shadowLayer0.shadowOffset = CGSize(width: -newValue, height: newValue)
                    shadowLayer1.shadowOffset = CGSize(width: newValue, height: -newValue)
                case .BottomLeft:
                    shadowLayer0.shadowOffset = CGSize(width: newValue, height: -newValue)
                    shadowLayer1.shadowOffset = CGSize(width: -newValue, height: newValue)
                case .BottomRight:
                    shadowLayer0.shadowOffset = CGSize(width: -newValue, height: -newValue)
                    shadowLayer1.shadowOffset = CGSize(width: newValue, height: newValue)
                }
            case .Pressed:
                break
            }
        }
    }
    
    override var backgroundColor: UIColor? {
        didSet {
            topLayer.backgroundColor = self.backgroundColor?.cgColor
        }
    }
    
    @IBInspectable var intensity: CGFloat {
        get {
            return self.shadowIntensity
        }
        set {
            self.shadowIntensity = newValue
            
            let redValue = self.backgroundColor?.redComponent
            let greenValue = self.backgroundColor?.greenComponent
            let blueValue = self.backgroundColor?.blueComponent
            
            shadowColor0 = UIColor.init(
                red: redValue!-(newValue/255),
                green: greenValue!-(newValue/255),
                blue: blueValue!-(newValue/255), alpha: 1)
            
            shadowColor1 = UIColor.init(
                red: redValue!+(newValue/255),
                green: greenValue!+(newValue/255),
                blue: blueValue!+(newValue/255), alpha: 1)
            
            shadowLayer0.shadowColor = shadowColor0?.cgColor
            shadowLayer1.shadowColor = shadowColor1?.cgColor
            
            gradientColor0 = UIColor.init(
                red: redValue!-(15/255),
                green: greenValue!-(15/255),
                blue: blueValue!-(15/255), alpha: 1)
            
            gradientColor1 = UIColor.init(
                red: redValue!+(15/255),
                green: greenValue!+(15/255),
                blue: blueValue!+(15/255), alpha: 1)
        }
    }
    
    fileprivate func setup() {
        shadowPath0 = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius)
        shadowLayer0.frame = self.bounds
        shadowLayer0.shadowPath = shadowPath0?.cgPath
        shadowLayer0.shadowColor = shadowColor0?.cgColor
        self.layer.addSublayer(shadowLayer0)
        
        shadowPath1 = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius)
        shadowLayer1.frame = self.bounds
        shadowLayer1.shadowPath = shadowPath1?.cgPath
        shadowLayer1.shadowColor = shadowColor1?.cgColor
        self.layer.addSublayer(shadowLayer1)
        
        topLayer.frame = self.bounds
        self.layer.addSublayer(topLayer)
        
        self.layer.addSublayer(gradientLayer)
        
        switch(shape) {
        case .Flat:
            break
        case .Concave:
            gradientLayer.cornerRadius = self.cornerRadius
            gradientLayer.frame = self.bounds
            gradientLayer.colors = [
                gradientColor0?.cgColor as Any, gradientColor1?.cgColor as Any
            ]
            gradientLayer.locations = [0, 1]
            self.layer.addSublayer(gradientLayer)
            
            switch(direction) {
            case .TopLeft:
                gradientLayer.startPoint = CGPoint(x: 0, y: 0)
                gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            case .TopRight:
                gradientLayer.startPoint = CGPoint(x: 1, y: 0)
                gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            case .BottomLeft:
                gradientLayer.startPoint = CGPoint(x: 0, y: 1)
                gradientLayer.endPoint = CGPoint(x: 1, y: 0)
            case .BottomRight:
                gradientLayer.startPoint = CGPoint(x: 1, y: 1)
                gradientLayer.endPoint = CGPoint(x: 0, y: 0)
            }
        case .Convex:
            gradientLayer.cornerRadius = self.cornerRadius
            gradientLayer.frame = self.bounds
            gradientLayer.colors = [
                gradientColor1?.cgColor as Any, gradientColor0?.cgColor as Any
            ]
            gradientLayer.locations = [0, 1]
            self.layer.addSublayer(gradientLayer)
            
            switch(direction) {
            case .TopLeft:
                gradientLayer.startPoint = CGPoint(x: 0, y: 0)
                gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            case .TopRight:
                gradientLayer.startPoint = CGPoint(x: 1, y: 0)
                gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            case .BottomLeft:
                gradientLayer.startPoint = CGPoint(x: 0, y: 1)
                gradientLayer.endPoint = CGPoint(x: 1, y: 0)
            case .BottomRight:
                gradientLayer.startPoint = CGPoint(x: 1, y: 1)
                gradientLayer.endPoint = CGPoint(x: 0, y: 0)
            }
        case .Pressed:
            switch(direction) {
            case .TopLeft:
                self.addInnerShadow(onSide: .topAndLeft, shadowColor: shadowColor0!.cgColor, shadowSize: shadowRadius/2, cornerRadius: cornerRadius, shadowOpacity: opacity)
                self.addInnerShadow(onSide: .bottomAndRight, shadowColor: shadowColor1!.cgColor, shadowSize: shadowRadius/2, cornerRadius: cornerRadius, shadowOpacity: opacity)
            case .TopRight:
                self.addInnerShadow(onSide: .topAndRight, shadowColor: shadowColor0!.cgColor, shadowSize: shadowRadius/2, cornerRadius: cornerRadius, shadowOpacity: opacity)
                self.addInnerShadow(onSide: .bottomAndLeft, shadowColor: shadowColor1!.cgColor, shadowSize: shadowRadius/2, cornerRadius: cornerRadius, shadowOpacity: opacity)
            case .BottomLeft:
                self.addInnerShadow(onSide: .bottomAndLeft, shadowColor: shadowColor0!.cgColor, shadowSize: shadowRadius/2, cornerRadius: cornerRadius, shadowOpacity: opacity)
                self.addInnerShadow(onSide: .topAndRight, shadowColor: shadowColor1!.cgColor, shadowSize: shadowRadius/2, cornerRadius: cornerRadius, shadowOpacity: opacity)
            case .BottomRight:
                self.addInnerShadow(onSide: .bottomAndRight, shadowColor: shadowColor0!.cgColor, shadowSize: shadowRadius/2, cornerRadius: cornerRadius, shadowOpacity: opacity)
                self.addInnerShadow(onSide: .topAndLeft, shadowColor: shadowColor1!.cgColor, shadowSize: shadowRadius/2, cornerRadius: cornerRadius, shadowOpacity: opacity)
            }
        }
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

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red: red, green: green, blue: blue, alpha: alpha)
    }

    var redComponent: CGFloat {
        var red: CGFloat = 0.0
        getRed(&red, green: nil, blue: nil, alpha: nil)

        return red
    }

    var greenComponent: CGFloat {
        var green: CGFloat = 0.0
        getRed(nil, green: &green, blue: nil, alpha: nil)

        return green
    }

    var blueComponent: CGFloat {
        var blue: CGFloat = 0.0
        getRed(nil, green: nil, blue: &blue, alpha: nil)

        return blue
    }

    var alphaComponent: CGFloat {
        var alpha: CGFloat = 0.0
        getRed(nil, green: nil, blue: nil, alpha: &alpha)

        return alpha
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
    
    static func contrastRatio(between color1: UIColor, and color2: UIColor) -> CGFloat {
        let luminance1 = color1.luminance()
        let luminance2 = color2.luminance()

        let luminanceDarker = min(luminance1, luminance2)
        let luminanceLighter = max(luminance1, luminance2)

        return (luminanceLighter + 0.05) / (luminanceDarker + 0.05)
    }

    func contrastRatio(with color: UIColor) -> CGFloat {
        return UIColor.contrastRatio(between: self, and: color)
    }
    
    func luminance() -> CGFloat {
        let ciColor = CIColor(color: self)
        
        func adjust(colorComponent: CGFloat) -> CGFloat {
            return (colorComponent < 0.04045) ?
                (colorComponent / 12.92) : pow((colorComponent + 0.055) / 1.055, 2.4)
        }
        
        return 0.2126 * adjust(colorComponent: ciColor.red)
            + 0.7152 * adjust(colorComponent: ciColor.green)
            + 0.0722 * adjust(colorComponent: ciColor.blue)
    }
}

extension UIView
{
    public enum innerShadowSide
    {
        case all, left, right, top, bottom, topAndLeft, topAndRight, bottomAndLeft, bottomAndRight, exceptLeft, exceptRight, exceptTop, exceptBottom
    }
    
    public func addInnerShadow(onSide: innerShadowSide, shadowColor: CGColor, shadowSize: CGFloat, cornerRadius: CGFloat = 0.0, shadowOpacity: Float)
    {
        let shadowLayer = CAShapeLayer()
        shadowLayer.frame = bounds
        shadowLayer.shadowColor = shadowColor
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowRadius = shadowSize
        shadowLayer.fillRule = CAShapeLayerFillRule.evenOdd
        
        let shadowPath = CGMutablePath()
        let insetRect = bounds.insetBy(dx: -shadowSize * 2.0, dy: -shadowSize * 2.0)
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
        
        shadowPath.addRect(insetRect)
        shadowPath.addRect(innerFrame)
        shadowLayer.path = shadowPath
        layer.addSublayer(shadowLayer)
        clipsToBounds = true
    }
}
```

2. Go to your storyboard, and add an UIView  
3. Open the Identity Inspector and type 'NeumorphicView' the Class field  
4. On the Attributes Inspector, change the values whatever you want
