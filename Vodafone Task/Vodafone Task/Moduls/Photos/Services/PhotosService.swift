//
//  PhotosService.swift
//  Vodafone Task
//
//  Created by Walid Elharby on 1/8/22.
//

import Foundation

class PhotosService: PhotosServiceProtocol {
    func getPhotossService(page:Int,success: @escaping ([PhotosModel]) -> (), failure: @escaping () -> ()) {

        NetworkService.fetchData(router: .getPhotos(page: page)) { (result: Result<[PhotosModel], Error>) in
            switch result {
            case .success(let data):
                success(data)
            case .failure(let error):
                print(error)
                failure()
            }
        }
    }

}
