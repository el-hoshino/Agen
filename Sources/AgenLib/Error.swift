//
//  Error.swift
//  
//
//  Created by 史 翔新 on 2020/05/06.
//

import Foundation

public func printError(_ error: Error) {
    
    let errorMessage = """
        Error: \(error)
        Please enter -h to get help."
        """
    print(errorMessage)
    
}
