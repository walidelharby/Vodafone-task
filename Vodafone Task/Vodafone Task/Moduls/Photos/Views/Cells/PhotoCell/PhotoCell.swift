//
//  CategoryContentCell.swift
//  Evntoo
//
//  Created by Walid Elharby on 4/5/21.
//

import UIKit
class PhotoCell: UICollectionViewCell {

    @IBOutlet weak var selectedBT: UIButton!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var Img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedBT.setTitle("", for: .normal)
        // Initialization code
    }

}
