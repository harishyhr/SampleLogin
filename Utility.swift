//
//  Utility.swift
//  Spectrum
//
//  Created by Harish on 14/12/18.
//  Copyright © 2018 Harish. All rights reserved.
//

import UIKit

class Utility {
    static func isValidPassword(_ password: String!) -> Bool {
        let alphaNumbericMinMax = "^[a-zA-Z0-9]{5,12}$"
        let atleastOneCharacter = "[a-zA-Z]{1,}"
        let atleastOneNumber = "[0-9]{1,}"
        let subSequencePresent = isSubStringSequencePresent(password: password)
        
        let reg1 = try! NSRegularExpression(pattern: alphaNumbericMinMax)
        let reg2 = try! NSRegularExpression(pattern: atleastOneCharacter)
        let reg3 = try! NSRegularExpression(pattern: atleastOneNumber)
        
        if (password.count == 0 || !(reg1.firstMatch(in: password, range: NSRange(location: 0, length: password.count)) != nil) || !(reg2.firstMatch(in: password, range: NSRange(location: 0, length: password.count)) != nil)  || !(reg3.firstMatch(in: password, range: NSRange(location: 0, length: password.count)) != nil)  || subSequencePresent)
        {
            return false
        }
        
        
        return true
    }
    
    static func isSubStringSequencePresent(password: String) -> Bool {
        for width in 2..<(password.count/2) {
            var index = 0
            while index + width <= password.count/2 {
                let end = index + width
                
                let firstIndexStart = password.index(password.startIndex, offsetBy: index)
                let firstIndexEnd = password.index(password.startIndex, offsetBy: end)
                let first = String(password[firstIndexStart..<firstIndexEnd])
                
                let secondIndexStart = password.index(password.startIndex, offsetBy: end)
                let secondIndexEnd = password.index(password.startIndex, offsetBy: width + end)
                let second = String(password[secondIndexStart..<secondIndexEnd])
                
                if first == second {
                    return true
                }
                
                index += 1
            }
        }
        
        return false
    }
    
    static func createAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okaction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okaction)
        
        return alert
    }

}
