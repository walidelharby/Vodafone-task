//
//  PhotosVC.swift
//  Vodafone Task
//
//  Created by Walid Elharby on 1/8/22.
//

import UIKit
import  SVProgressHUD
class PhotosVC: UIViewController {
    // OUTLETS HERE
    //MARK:- Outlets
    @IBOutlet weak var photoCollectionView: UICollectionView!

    // VARIABLES HERE
    // MARK: - Properties
    private(set) var cell = "PhotoCell"
    var viewModel = PhotosViewModel()
    var page:Int = 1
    var total:Int = 0
    var index:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
       photoCollectionView.register(UINib(nibName: cell, bundle: nil), forCellWithReuseIdentifier: cell)
     //   self.index = 0
        viewModel.GetPhotos(page: 1)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
     

    }
    // MARK: - setupViewModel_Funcs
    fileprivate func setupViewModel() {

        self.viewModel.showAlertClosure = {
            let alert = self.viewModel.alertMessage ?? ""
            print(alert)
        }
        
        self.viewModel.updateLoadingStatus = {
            if self.viewModel.isLoading {
            } else {
                 print("DATA READY")
            }
        }

        self.viewModel.internetConnectionStatus = {
            print("Internet disconnected")
            // show UI Internet is disconnected
        }

        self.viewModel.serverErrorStatus = {
            print("Server Error / Unknown Error")
            // show UI Server is Error
        }
      
        self.viewModel.didGetData = {

            self.photoCollectionView.reloadData()
        }

    }


}
extension PhotosVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
    

        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let num = (viewModel.getCount()/5)
        self.total = viewModel.getCount()
       print("total\(total)")
        return self.total
            
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     

        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cell, for: indexPath) as! PhotoCell

//        if indexPath.row == 0{
//
//
//
//            }else if indexPath.item % 6 == 0{
//                cell.authorName.text = "ad Name"
//                cell.Img.image = UIImage(named: "ad-placeholder")
//
//
//
//            }else{
              
        cell.Img.setImage(with: viewModel.getImageURL(index: indexPath.row))
                cell.authorName.text = viewModel.getauthorName(index: indexPath.row)

                self.index = self.index + 1

//
//            }
        if indexPath.row == self.total-1{
            if !viewModel.islastpage{
            page = page+1
                viewModel.GetPhotos(page: page)}
        }
        return cell

    }

   

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if indexPath.row == 0{
//               return CGSize(width: view.frame.width, height: 0.0)
//        }else{
            return CGSize(width: (self.view.frame.width / 2) - 10, height: 200)
   //        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          
        if let vc = UIStoryboard.init(name: "Photo", bundle: Bundle.main).instantiateViewController(withIdentifier: "ShowImageVC") as? ShowImageVC{
        vc.modalPresentationStyle = .fullScreen
        vc.url = self.viewModel.getImageURL(index: indexPath.row)
            self.present(vc, animated: true, completion: nil)
            
        }
        
    }



}
