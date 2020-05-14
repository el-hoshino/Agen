//
//  AmazonProductNumber.swift
//  
//
//  Created by 史 翔新 on 2020/05/06.
//

import Foundation

struct AmazonProductNumber: Equatable {
    
    enum Prefix: Equatable {
        case dp
        case gpProduct
    }
    
    var prefix: Prefix
    var number: String
    
}

extension AmazonProductNumber {
    
    static func find(in pathComponents: [String]) -> AmazonProductNumber? {
        
        if let number = pathComponents.element(following: { $0.last == "dp" }) {
            return .init(prefix: .dp, number: number)
            
        } else if let number = pathComponents.element(following: {
            $0.elementBeforeLast == "gp" && $0.last == "product"
        }) {
            return .init(prefix: .gpProduct, number: number)
            
        } else {
            return nil
        }
        
    }
    
}

extension AmazonProductNumber {
    
    var pathCompoonents: [String] {
        
        switch prefix {
        case .dp:
            return ["dp", number]
            
        case .gpProduct:
            return ["gp", "product", number]
        }
        
    }
    
}

private extension Array {
    
    func element(following execution: (ArraySlice<Element>) throws -> Bool) rethrows -> Element? {
                
        for (offset, element) in enumerated() {
            
            let slice = self[..<offset]
            let isThisWanted = try execution(slice)
            if isThisWanted {
                return element
            }
            
        }
        
        return nil
        
    }
    
}
