//
//  AmazonLinkUtility.swift
//  
//
//  Created by 史 翔新 on 2020/05/06.
//

import Foundation

public final class AmazonLinkUtility {
        
    public enum LinkStringValidationError: Error, Equatable {
        case linkStringIsNotURL(linkString: String)
        case linkStringHasNoScheme(linkURL: URL)
        case linkIsNotFromAmazon(linkURL: URL)
        case linkIsFromAmazonButHasNoProduct(linkURL: URL)
    }
    
    public init() {}
    
    public func shortenLinkString(of originalLinkString: String) throws -> String {
        
        guard let url = URL(rawString: originalLinkString) else {
            throw LinkStringValidationError.linkStringIsNotURL(linkString: originalLinkString)
        }
        
        guard let scheme = url.scheme else {
            throw LinkStringValidationError.linkStringHasNoScheme(linkURL: url)
        }
        
        guard let host = url.host, host.contains(".amazon.") else {
            throw LinkStringValidationError.linkIsNotFromAmazon(linkURL: url)
        }
        
        guard let number = AmazonProductNumber.find(in: url.pathComponents) else {
            throw LinkStringValidationError.linkIsFromAmazonButHasNoProduct(linkURL: url)
        }
        
        guard let shortenURL = URL(scheme: scheme, host: host, path: number.pathCompoonents) else {
            throw NSError(domain: "AmazonLinkUtility", code: -1, userInfo: [
                "Description": "Unknown",
                "OriginalLinkString": originalLinkString,
            ])
        }
        
        return shortenURL.absoluteString
        
    }
    
}
