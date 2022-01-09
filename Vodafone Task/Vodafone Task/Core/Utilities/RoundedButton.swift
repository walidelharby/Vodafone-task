//
//  RoundedButton.swift
//  Brightskies_Test
//
//  Created by Walid Elharby on 3/27/21.
//

import UIKit


class RoundedButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        refreshCorners(value: cornerRadius)
        refreshBorderColor(color: borderColor)
        refreshBorder(width: borderWidth)
    }
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
    func refreshBorder(width: CGFloat) {
        layer.borderWidth = width
    }
    
    func refreshBorderColor(color : CGColor) {
        layer.borderColor = color
    }
    
    @IBInspectable var cornerRadius: CGFloat = 20 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet {
            refreshBorder(width: borderWidth)
        }
    }
    
    @IBInspectable var borderColor: CGColor = #colorLiteral(red: 0.1329063177, green: 0.2857988775, blue: 0.6338515878, alpha: 1) {
        didSet {
            refreshBorderColor(color: borderColor)
        }
    }
    
}



