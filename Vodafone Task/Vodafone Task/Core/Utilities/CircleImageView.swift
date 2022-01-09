//
//  CircleImageView.swift
//  Brightskies_Test
//
//  Created by Walid Elharby on 3/27/21.
//

import UIKit

class CircleImageView: UIImageView {
    override func awakeFromNib() {
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    func setupView() {
        //        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: 100, height: 100)
        self.contentMode = UIView.ContentMode.scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }
    
}
