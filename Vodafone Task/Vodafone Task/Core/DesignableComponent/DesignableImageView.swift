

import UIKit

@IBDesignable class DesignableImageView: UIImageView {
    
    @IBInspectable
    var circleCorner: Bool
    {
        get {
            return min(bounds.size.height, bounds.size.width) / 2 == cornerRadius
        }
        set {
            cornerRadius = newValue ? min(bounds.size.height, bounds.size.width) / 2 : cornerRadius
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var TopRightcornerRadius: CGFloat = 0.0 {
           didSet {
               layer.cornerRadius = TopRightcornerRadius
        layer.maskedCorners = [.layerMinXMinYCorner]
            layer.masksToBounds = TopRightcornerRadius > 0

           }
       }
    @IBInspectable var TopleftcornerRadius: CGFloat = 0.0 {
           didSet {
               layer.cornerRadius = TopleftcornerRadius
        layer.maskedCorners = [.layerMaxXMinYCorner]
            layer.masksToBounds = TopleftcornerRadius > 0

           }
       }
    @IBInspectable var BottomRightcornerRadius: CGFloat = 0.0 {
           didSet {
               layer.cornerRadius = BottomRightcornerRadius
        layer.maskedCorners = [.layerMinXMaxYCorner]
            layer.masksToBounds = BottomRightcornerRadius > 0

           }
       }
    @IBInspectable var BottomleftcornerRadius: CGFloat = 0.0 {
           didSet {
               layer.cornerRadius = BottomleftcornerRadius
        layer.maskedCorners = [.layerMaxXMaxYCorner]
            layer.masksToBounds = BottomleftcornerRadius > 0

           }
       }

    @IBInspectable var TopcornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = TopcornerRadius
     layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
         layer.masksToBounds = TopcornerRadius > 0

        }
    }
    @IBInspectable var BottomcornerRadius: CGFloat = 0.0 {
          didSet {
              layer.cornerRadius = BottomcornerRadius
       layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
           layer.masksToBounds = BottomcornerRadius > 0

          }
      }
    @IBInspectable var RightcornerRadius: CGFloat = 0.0 {
          didSet {
              layer.cornerRadius = RightcornerRadius
       layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
           layer.masksToBounds = RightcornerRadius > 0

          }
      }
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
}

