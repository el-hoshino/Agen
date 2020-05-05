//
//  Parser.swift
//  
//
//  Created by 史 翔新 on 2020/05/06.
//

import Foundation
import AmazonLinkUtility

// TODO: Transit to Swift Argument Parser when stable: https://github.com/apple/swift-argument-parser
public final class Parser {
    
    enum ParsingError: Error, Equatable {
        case invalidOption(String)
        case invalidArguments(ArraySlice<String>)
        case urlStringNotFound(arguments: [String])
    }
    
    public enum Result: Equatable {
        public struct URLString: Equatable {
            public struct Settings: Equatable {
                public var originalURLString: String = ""
                public var shouldCopyToPasteboard: Bool = true
            }
            public let settings: Settings
            public let urlString: String
        }
        case showHelp
        case showVersion
        case shortenURLString(URLString)
    }
    
    public init() {
        
    }
    
    public func parse(_ arguments: [String]) throws -> Result {
        
        var parsingArguments = arguments.dropFirst()
        
        if let result = foundShouldFinishParsingCommand(from: parsingArguments) {
            return result
        }
        
        var settings = Result.URLString.Settings()
        while !parsingArguments.isEmpty {
            try extractNormalParsingCommand(from: &parsingArguments, into: &settings)
        }
        
        guard !settings.originalURLString.isEmpty else {
            throw ParsingError.urlStringNotFound(arguments: arguments)
        }
        
        let utility = AmazonLinkUtility()
        let shortenString = try utility.shortenLinkString(of: settings.originalURLString)
                
        return .shortenURLString(.init(settings: settings, urlString: shortenString))
        
    }
    
}

extension Parser {
    
    private func foundShouldFinishParsingCommand(from arguments: ArraySlice<String>) -> Result? {
        
        if arguments.contains("-h") || arguments.contains("--help") {
            return .showHelp
            
        } else if arguments.contains("-v") || arguments.contains("--version") {
            return .showVersion
            
        } else {
            return nil
        }
        
    }
    
    private func extractNormalParsingCommand(from arguments: inout ArraySlice<String>, into settings: inout  Result.URLString.Settings) throws {
        
        guard let argument = arguments.first else {
            return
        }
        
        switch argument {
        case "-nc", "--no-copy":
            settings.shouldCopyToPasteboard = false
            arguments.removeFirst()
            
        case let invalidOption where invalidOption.starts(with: "-"):
            throw ParsingError.invalidOption(invalidOption)
            
        case let url:
            guard settings.originalURLString.isEmpty else {
                throw ParsingError.invalidArguments(arguments)
            }
            settings.originalURLString = url
            arguments.removeFirst()
        }
        
    }
    
}
