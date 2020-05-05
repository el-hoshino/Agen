//
//  File.swift
//  
//
//  Created by 史 翔新 on 2020/05/06.
//

import Foundation

extension Sequence {
    
    func element(following execution: (Element) -> Bool) -> Element? {
        
        var iterator = makeIterator()
        var isNextElementWanted = false
        
        while let next = iterator.next() {
            
            if isNextElementWanted {
                return next
                
            } else if execution(next) == true {
                isNextElementWanted = true
                
            }
            
        }
        
        return nil
        
    }
    
}
