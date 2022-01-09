//
//  PhotosModel.swift
//  Vodafone Task
//
//  Created by Walid Elharby on 1/8/22.
//

import Foundation
// MARK: - PhotosModelElement
struct PhotosModel: Codable{
    let id, author: String?
    let width, height: Int?
    let url, downloadURL: String?

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}


