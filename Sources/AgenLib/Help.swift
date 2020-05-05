//
//  Help.swift
//  
//
//  Created by 史 翔新 on 2020/05/06.
//

import Foundation

public func printHelp() {
    
    let help = """
    Agen is amazon product link shortener.
    
    Usage:
        $ agen [options] <url_string>
        
    Arguments:
        -h / --help: Help. (This will ignore all other arguments and won't perform an output.)
        -v / --version: Print version number. (This will ignore all other arguments and won't perform any output.)
        -nc / --no-copy: Don't copy the result to pasteboard.
    """
    
    print(help)
    
}
