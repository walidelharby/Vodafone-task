//
//  PhotosViewModel.swift
//  Vodafone Task
//
//  Created by Walid Elharby on 1/8/22.
//

import Foundation
import SVProgressHUD
class PhotosViewModel {
    // MARK: - Properties

    private let service: PhotosServiceProtocol

     var model: [PhotosModel]?
    var islastpage:Bool = false
    /// Count your data in model

    //MARK: -- Network checking

    /// Define networkStatus for check network connection
    var networkStatus = Reach().connectionStatus()

    /// Define boolean for internet status, call when network disconnected
    var isDisconnected: Bool = false {
        didSet {
            self.alertMessage = "No network connection. Please connect to the internet"
            self.internetConnectionStatus?()
        }
    }

    //MARK: -- UI Status

    /// Update the loading status, use HUD or Activity Indicator UI
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }

    /// Showing alert message, use UIAlertController or other Library
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }

    /// Define selected model
    var selectedObject: PhotosModel?

    //MARK: -- Closure Collection
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var internetConnectionStatus: (() -> ())?
    var serverErrorStatus: (() -> ())?
    var didGetData: (() -> ())?

    init(withRecipes serviceProtocol: PhotosServiceProtocol = PhotosService() ) {
        self.service = serviceProtocol

        NotificationCenter.default.addObserver(self, selector: #selector(self.networkStatusChanged(_:)), name: NSNotification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
        Reach().monitorReachabilityChanges()

    }

    //MARK: Internet monitor status
    @objc func networkStatusChanged(_ notification: Notification) {
        self.networkStatus = Reach().connectionStatus()
    }

    //MARK: -- Example Func
    func GetPhotos(page:Int) {
        switch networkStatus {
        case .offline:
            self.isDisconnected = true
            self.internetConnectionStatus?()
        case .online:
            // call your service here
            self.isLoading = true

            self.service.getPhotossService(page: page, success: { data in

                    self.isLoading = false
                if page != 1 {
                    if data.count != 0 {
                   
                    for item in data {
              
                    self.model?.append(item)

                 
                    }
                        self.didGetData?()

                    }else{
                        self.islastpage = true
                    }

                    
                }else{
                        self.model = data
                    self.didGetData?()

                    }
               }){
                    self.isLoading = false
    
                }
        default:
            break
        }
    }

}

extension PhotosViewModel {
    // MARK: - PhotosData Func
    func getCount() -> Int {
        return model?.count ?? 0
    }
    
    func getImageURL(index:Int) -> String {
        guard let img = model?.getElement(at: index)?.downloadURL   else {
            return ""
        }
        return img
    }
    func getauthorName(index:Int) -> String {
        guard let author = model?.getElement(at: index)?.author   else {
            return ""
        }
        return author
    }
    func getImagedownloadURl(index:Int) -> String {
        guard let url = model?.getElement(at: index)?.downloadURL else {
            return ""
        }
        return url
    }
    

}
