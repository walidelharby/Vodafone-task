//
//  Offline+CoreDataProperties.swift
//  
//
//  Created by walid Elharby on 09/01/2022.
//
//

import Foundation
import CoreData


extension Offline {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Offline> {
        return NSFetchRequest<Offline>(entityName: "Offline")
    }


}
