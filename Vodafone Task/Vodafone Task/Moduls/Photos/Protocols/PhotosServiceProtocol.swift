//
//  PhotosServiceProtocol.swift
//  Vodafone Task
//
//  Created by Walid Elharby on 1/8/22.
//

import Foundation
protocol PhotosServiceProtocol {

    /// SAMPLE FUNCTION -* Please rename this function to your real function
    ///
    /// - Parameters:
    ///   - success: -- success closure response, add your Model on this closure.
    ///                 example: success(_ data: YourModelName) -> ()
    ///   - failure: -- failure closure response, add your Model on this closure.
    ///                 example: success(_ data: APIError) -> ()
    func getPhotossService(page:Int,success: @escaping(_ data: [PhotosModel]) -> (), failure: @escaping() -> ())

}
