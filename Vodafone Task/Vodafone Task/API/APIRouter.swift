//
//  APIRouter.swift
//  Vodafone Task

//  Created by Walid Elharby on 1/8/21.
//
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    

    //MARK: - - Home
    case getPhotos(page:Int)
   
    static let baseURLString = "https://picsum.photos/v2/list"
    
    var method: HTTPMethod {
        switch self {
        // MARK: - - Fetch Auth HTTP Method
        case .getPhotos:
            return .get
        default:
            return .post
        }
    }
    
    var path: String {
        switch self {
        // MARK: - - Fetch Auth Path
        case .getPhotos:
            return ""
        }
    }
    
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var params = Parameters()
        
        let url = try APIRouter.baseURLString.asURL()
        // let encoder = JSONEncoder()
        // dummy values
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        
        
        switch self {
       
    
        case .getPhotos(page: let page):
            params = [
                "page":page,
                "limit":1000
            ]
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        }
        
        
        print("Param ---\(params)")
        
        return urlRequest
    }
}

