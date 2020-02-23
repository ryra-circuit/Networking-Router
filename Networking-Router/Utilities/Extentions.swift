//
//  Extentions.swift
//  Copyright © 2019 Elegant Media Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit

extension Dictionary {
    // To Update Parameter dictionary
    mutating func updateDictionary(otherValues: Dictionary) {
        for (key, value) in otherValues {
            self.updateValue(value, forKey: key)
        }
    }
    
    func removeNullKeysFromParameterDictionary() -> Dictionary {
        var dict = self
        let keysToRemove = Array(dict.keys).filter { dict[$0] is NSNull }
        for key in keysToRemove {
            dict.removeValue(forKey: key)
        }
        return dict
    }
    
    func removeNullZeroEmptyKeysFromParameterDictionary() -> Dictionary {
        var dict = self
        let keysToRemove = Array(dict.keys).filter { dict[$0] is NSNull || ((dict[$0] as? Int) == 0) || ((dict[$0] as? String) == "") }
        for key in keysToRemove {
            dict.removeValue(forKey: key)
        }
        return dict
    }
}

extension String {
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func removingAllWhitespaces() -> String {
        return removingCharacters(from: .whitespaces)
    }
    
    func removingCharacters(from set: CharacterSet) -> String {
        var newString = self
        newString.removeAll { char -> Bool in
            guard let scalar = char.unicodeScalars.first else { return false }
            return set.contains(scalar)
        }
        return newString
    }
    
    //get Date string and split it
    func getDateString() -> String {
        let dateStr = self
        let dateValue = dateStr.components(separatedBy: " ")
        let date = dateValue[0]
        return date
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    func htmlAttributedString(family: String?, size: CGFloat, hexString: String) -> NSAttributedString? {
        do {
            let htmlCSSString = "<style>" +
                "html *" +
                "{" +
                "font-size: \(size)pt !important;" +
                "color: #\(hexString) !important;" +
                "font-family: \(family ?? "Helvetica"), Helvetica !important;" +
            "}</style> \(self)"
            
            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }
            
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
}

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}

extension Bundle {
    var appName: String? {
        return infoDictionary?["CFBundleName"] as? String
    }
    
    var bundleId: String? {
        return bundleIdentifier
    }
    
    var versionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var buildNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
