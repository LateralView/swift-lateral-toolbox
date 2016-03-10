//
//  String.swift
//  Pods
//
//  Created by Leandro Tami on 1/18/16.
//
//

import Foundation

extension String
{
    
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: startIndex.advancedBy(r.startIndex), end: startIndex.advancedBy(r.endIndex)))
    }
        
    public var URLEncode : String? {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
    }
    
    public var URLDecode : String? {
        return self.stringByRemovingPercentEncoding
    }

    public func trim () -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    public func randomAlphanumericString(length: Int) -> String
    {
        // from: http://stackoverflow.com/a/33860834
        let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let allowedCharsCount = UInt32(allowedChars.characters.count)
        var randomString = ""
        for _ in (0..<length) {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let newCharacter = allowedChars[allowedChars.startIndex.advancedBy(randomNum)]
            randomString += String(newCharacter)
        }
        return randomString
    }
    
    public func isValidEmailAddress() -> Bool
    {
        // from: http://www.ios-blog.co.uk/tutorials/objective-c/objective-c-validate-e-mail-address/
        guard self.characters.count > 0 else {
            return false
        }
        
        let regexStr = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        do {
            let regex = try NSRegularExpression(pattern: regexStr, options: .CaseInsensitive)
            let matches = regex.numberOfMatchesInString(self, options: [], range: NSMakeRange(0, self.characters.count))
            return matches > 0
        } catch {
            return false
        }        
    }
    
}