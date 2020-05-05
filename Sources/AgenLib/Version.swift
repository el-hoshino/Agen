//
//  Version.swift
//  
//
//  Created by 史 翔新 on 2020/05/06.
//

import Foundation

public func printVersion() {
    
    let dictionary = Bundle.main.infoDictionary ?? {
        assertionFailure("Failed to find Info.plist")
        return [:]
    }()
    let version = dictionary["CFBundleShortVersionString"] as? String ?? {
        assertionFailure(#"Failed to find "CFBundleShortVersionString" value in dictionary \#(dictionary)"#)
        return "Unknown"
    }()
    
    print(version)
    
}
