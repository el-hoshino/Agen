//
//  URL+.swift
//  
//
//  Created by 史 翔新 on 2020/05/06.
//

import Foundation

extension URL {
    
    init?(rawString: String) {
        
        if let url = URL(string: rawString) {
            self = url
            
        } else if let encodedURLString = rawString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                  let url = URL(string: encodedURLString) {
            self = url
            
        } else {
            return nil
        }
        
    }
    
    init?(scheme: String, host: String, path: [String]) {
        let domainString = "\(scheme)://\(host)"
        guard var url = URL(string: domainString) else {
            return nil
        }
        path.forEach {
            url.appendPathComponent($0)
        }
        self = url
    }
    
}
