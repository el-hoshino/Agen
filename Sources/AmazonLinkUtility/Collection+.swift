//
//  Collection+.swift
//  
//
//  Created by 史 翔新 on 2020/05/06.
//

import Foundation

extension Collection where Index: BinaryInteger {
    
    var elementBeforeLast: Element? {
        
        if endIndex >= 2 {
            return self[endIndex - 2]
        } else {
            return nil
        }
        
    }
    
}
