//
//  Validation.swift
//  Brightskies_Test
//
//  Created by Walid Elharby on 3/27/21.
//

import UIKit

class Validation: NSObject {
    
    public static let shared = Validation()
    
    func validate(values: (type: ValidationType, inputValue: String, textField: UITextField)...) -> (UITextField, Valid) {
        for valueToBeChecked in values {
            switch valueToBeChecked.type {
            case .email:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .email, .emptyEmail, .inValidEmail)) {
                    return (valueToBeChecked.textField, tempValue)
                }
            case .stringWithFirstLetterCaps:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .alphabeticStringFirstLetterCaps, .emptyFirstLetterCaps, .invalidFirstLetterCaps)) {
                    return (valueToBeChecked.textField, tempValue)
                }
            case .phoneNo:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .phoneNo, .emptyPhone, .inValidPhone)) {
                    return (valueToBeChecked.textField, tempValue)
                }
            case .alphabeticString:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .alphabeticStringWithSpace, .emptyAlphabeticString, .invalidAlphabeticString)) {
                    return (valueToBeChecked.textField, tempValue)
                }
            case .password:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .password, .emptyPSW, .inValidPSW)) {
                    return (valueToBeChecked.textField, tempValue)
                }
            case .percentage:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .percentage, .emptyPerc, .inValidPerc)) {
                    return (valueToBeChecked.textField, tempValue)
                }
            case .countryKey:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .countryKey, .emptyPhone, .inValidPhone)) {
                    return (valueToBeChecked.textField, tempValue)
                }
            case .number:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .number, .emptyPhone, .inValidPhone)) {
                    return (valueToBeChecked.textField, tempValue)
                }
            }
        }
        return (UITextField(), .success)
    }
    
    func isValidString(_ input: (text: String, regex: RegEx, emptyAlert: AlertMessages, invalidAlert: AlertMessages)) -> Valid? {
        if input.text.isEmpty {
            return .failure(.error, input.emptyAlert)
        } else if isValidRegEx(input.text, input.regex) != true {
            return .failure(.error, input.invalidAlert)
        }
        return nil
    }
    
    func isValidRegEx(_ testStr: String, _ regex: RegEx) -> Bool {
        let stringTest = NSPredicate(format: "SELF MATCHES %@", regex.rawValue)
        let result = stringTest.evaluate(with: testStr)
        return result
    }
}

enum Alert {        //for failure and success results
    case success
    case failure
    case error
}
//for success or failure of validation with alert message
enum Valid {
    case success
    case failure(Alert, AlertMessages)
}
enum ValidationType {
    case email
    case stringWithFirstLetterCaps
    case phoneNo
    case number
    case alphabeticString
    case password
    case percentage
    case countryKey
}
enum RegEx: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" // Email
    case password = "^.{6,15}$" // Password length 6-15
    case alphabeticStringWithSpace = "^[A-Za-zء-ي ]+$" // e.g. hello sandeep
    case alphabeticStringFirstLetterCaps = "^[A-Z]+[a-zA-Z]*$" // SandsHell
    case phoneNo = "[0-9]{9,13}" // PhoneNo 10-14 Digits        //Change RegEx according to your Requirement
    case percentage = "[0-9]{1,2}"
    case countryKey = "[0-9]{1,4}"
    case number = "[0-9]{1,10}"
}


enum AlertMessages: String {
    case inValidEmail = "inValidEmail" //"inValidEmail"
    case invalidFirstLetterCaps = "invalidFirstLetterCaps"
    case inValidPhone = "inValidPhone"
    case invalidAlphabeticString = "invalidName"
    case inValidPSW =  "inVaildPassword"  //"inValidPSW"
    case inValidPerc = "inValidPerc"
    
    case emptyPhone = "emptyPhone"
    case emptyEmail =  "emptyEmail" //"emptyEmail"
    case emptyFirstLetterCaps = "emptyFirstLetterCaps"
    case emptyAlphabeticString = "emptyName"
    case emptyPSW =  "emptyPassword"   //"emptyPSW"
    case emptyPerc = "emptyPerc"
    
    func localized() -> String {
        return self.rawValue.localized
    }
    
    
}
