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
            self.photoCollectionView.reloadData()
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
        return viewModel.getCount()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     

        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cell, for: indexPath) as! PhotoCell
        cell.Img.image = UIImage()
        if indexPath.row == 0{
            }else if indexPath.item % 6 == 0{
                cell.authorName.text = "ad Title"
                cell.Img.image = UIImage(named: "ad-placeholder")
                cell.selectedBT.isUserInteractionEnabled = false
            }else{
                cell.selectedBT.isUserInteractionEnabled = true
                let index = viewModel.getCurrentindex(index: indexPath.row)
                cell.Img.setImage(with: viewModel.getImageURL(index:index))
                cell.authorName.text = viewModel.getauthorName(index:index)
        cell.selectedBT.addTarget(self, action: #selector(selected(sender:)), for: .touchUpInside)
        cell.selectedBT.tag = viewModel.getCurrentindex(index: indexPath.row)


           }
        if indexPath.row == viewModel.getCount()-1{
            if !viewModel.islastpage{
            page = page+1
                viewModel.GetPhotos(page: page)

            }
        }
        return cell

    }

   

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0{
            return CGSize(width: view.frame.width, height: 0.0)

        }else if indexPath.item % 6 == 0 {
            return CGSize(width: (self.view.frame.width) - 10, height: 200)

        }else{
            return CGSize(width: (self.view.frame.width / 2) - 10, height: 200)
         }
    }
    @objc func selected(sender: UIButton){
        
        if let vc = UIStoryboard.init(name: "Photo", bundle: Bundle.main).instantiateViewController(withIdentifier: "ShowImageVC") as? ShowImageVC{
        vc.modalPresentationStyle = .overCurrentContext
            vc.url = self.viewModel.getImageURL(index: sender.tag)
            vc.Imagename = self.viewModel.getauthorName(index: sender.tag)
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
   



}
