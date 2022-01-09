//
//  PhotoVc.swift
//  Vodafone Task
//
//  Created by Walid Elharby on 1/8/22.
//

import UIKit

class PhotoVc: UIViewController {
    // OUTLETS HERE
    //MARK:- Outlets

    
    // VARIABLES HERE
    // MARK: - Properties
    private(set) var cell = "PhotoCell"
    var viewModel = PhotosViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
//        categorydetailsCollectionView.register(UINib(nibName: cell2, bundle: nil), forCellWithReuseIdentifier: cell)

        // Do any additional setup after loading the view.
    }
    
    // MARK: - setupViewModel_Funcs
    fileprivate func setupViewModel() {

        self.viewModel.showAlertClosure = {
            let alert = self.viewModel.alertMessage ?? ""
            print(alert)
        }
        
        self.viewModel.updateLoadingStatus = {
            if self.viewModel.isLoading {
                print("LOADING...")
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
//            self.recipesTableview.reloadData()
        }

    }


}
