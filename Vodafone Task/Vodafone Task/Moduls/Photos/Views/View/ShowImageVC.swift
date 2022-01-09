//
//  ShowImageVC.swift
//  Vodafone Task
//
//  Created by walid Elharby on 09/01/2022.
//

import UIKit
import Kingfisher
class ShowImageVC: UIViewController {

    @IBOutlet weak var img: UIImageView!
    var url:String?
     var Imagename:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Imagename
        if let imgurl = self.url{
            self.img.setImage(with: imgurl)
            self.img.kf.setImage(with: URL(string: url ?? ""),completionHandler: {(RetrieveImageResult) in
                
                print(RetrieveImageResult)
                self.view.backgroundColor =  self.img.image?.averageColor

            
            })
        }

    }
    override func viewWillAppear(_ animated: Bool) {

    }
  
    
   

}
