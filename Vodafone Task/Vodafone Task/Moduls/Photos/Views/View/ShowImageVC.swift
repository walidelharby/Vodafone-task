//
//  ShowImageVC.swift
//  Vodafone Task
//
//  Created by walid Elharby on 09/01/2022.
//

import UIKit

class ShowImageVC: UIViewController {

    @IBOutlet weak var img: UIImageView!
    var url:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imgurl = self.url{
            self.img.setImage(with: imgurl)
            self.view.backgroundColor =  self.img.image?.averageColor
        }

    }
    override func viewWillAppear(_ animated: Bool) {

    }
    @IBAction func didPressClose(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
   

}
