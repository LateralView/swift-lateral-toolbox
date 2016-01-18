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
    
    public func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: " "))
    }
    
    public func randomAlphaNumericString(length: Int) -> String
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
    
}