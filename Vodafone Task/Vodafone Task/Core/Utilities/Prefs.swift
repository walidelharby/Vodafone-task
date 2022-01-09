//
//  Prefs.swift
//  Vodafone Task
//
//  Created by walid Elharby on 09/01/2022.
//

import Foundation
import UIKit

typealias UD = UserDefaults

var prefs: UserDefaults {
    return UserDefaults.standard
}



extension UserDefaults {
    
    enum PrefKeys {
        static let offlinemodel = "offlinemodel"
 
    }
    
    func set<T>(encodable object: T?, forKey key: String) where T: Encodable {
        guard let object = object else {
            prefs.set(nil, forKey: key)
            return
        }
        if let encoded = try? JSONEncoder().encode(object) {
            prefs.set(encoded, forKey: key)
        }
    }
    
    func decodable<T>(forKey key: String, of type: T.Type) -> T? where T: Decodable {
        guard let jsonData = prefs.data(forKey: key),
            let object = try? JSONDecoder().decode(type, from: jsonData) else {
                return nil
        }
        return object
    }
}
extension UserDefaults: ObjectSavable {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            set(data, forKey: forKey)
        } catch {
            throw ObjectSavableError.unableToEncode
        }
    }
    
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable {
        guard let data = data(forKey: forKey) else { throw ObjectSavableError.noValue }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch {
            throw ObjectSavableError.unableToDecode
        }
    }
}
protocol ObjectSavable {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
}
enum ObjectSavableError: String, LocalizedError {
    case unableToEncode = "Unable to encode object into data"
    case noValue = "No data object found for the given key"
    case unableToDecode = "Unable to decode object into given type"
    
    var errorDescription: String? {
        rawValue
    }
}

