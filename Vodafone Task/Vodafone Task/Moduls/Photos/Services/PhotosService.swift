//
//  PhotosService.swift
//  Vodafone Task
//
//  Created by Walid Elharby on 1/8/22.
//

import Foundation
import  Alamofire

class PhotosService: PhotosServiceProtocol {
    func getPhotossService(page:Int,success: @escaping ([PhotosModel]) -> (), failure: @escaping () -> ()) {
   
        AF.request(APIRouter.getPhotos(page:page))
            .responseJSON(completionHandler: { (resp) in
                print("Get recipes \(resp)")
            })
            .responseDecodable {  (response: DataResponse<[PhotosModel], AFError>) in
                switch response.result {
                    
                case .success(let data):
                    
                    success(data)

                case .failure(let err):
                    print(err)
                    print("Get My Answer Failure")
                }
        }
    }

}
