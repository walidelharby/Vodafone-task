//
//  CardView.swift
//  Brightskies_Test
//
//  Created by Walid Elharby on 3/28/21.
//
//

import UIKit


class CardView: UIView {
    
    @IBInspectable var cornerrRadius: CGFloat = 6
    @IBInspectable var shadowOffSetWidth: CGFloat = 2
    @IBInspectable var shadowOffSetHeight: CGFloat = 3
    @IBInspectable var shadowOpacity: CGFloat = 0.5
    @IBInspectable var shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    @IBInspectable var BorderWidth: CGFloat = 0
    @IBInspectable var BorderColor = #colorLiteral(red: 0.07058823529, green: 0.07058823529, blue: 0.07058823529, alpha: 0.08)

    override func layoutSubviews() {
        layer.cornerRadius = cornerrRadius
        layer.shadowColor = shadowColor.cgColor
        layer.borderWidth = BorderWidth
        layer.borderColor = BorderColor.cgColor

        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerrRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = Float(shadowOpacity)
    }
    
}
