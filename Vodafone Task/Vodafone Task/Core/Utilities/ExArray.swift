//
//  ExArray.swift
//  Brightskies_Test
//
//  Created by Walid Elharby on 3/27/21.
//

import Foundation

extension Array {
    func getElement(at index: Int) -> Element? {
        let isValidIndex = index >= 0 && index < count
        return isValidIndex ? self[index] : nil
    }
}
