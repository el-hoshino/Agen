//
//  File.swift
//  
//
//  Created by 史 翔新 on 2020/05/06.
//

import XCTest
import AmazonLinkUtility
@testable import AgenLib

final class ParserTests: XCTestCase {
    
    func testSuccessParsing() {
        
        typealias TestCase = (command: String, expected: Parser.Result)
        let testCases: [TestCase] = [
            ("agen -h", .showHelp),
            ("agen -h -v", .showHelp),
            ("agen -h -l 13", .showHelp),
            ("agen -v", .showVersion),
            ("agen -v -nl", .showVersion),
            ("agen https://www.amazon.co.jp/旅のおわり/dp/B083L898MC/ref=sr_1_1?__mk_ja_JP=カタカナ&dchild=1&keywords=部屋キャン&qid=1588701547&sr=8-1", .shortenURLString(.init(settings: .init(originalURLString: "https://www.amazon.co.jp/旅のおわり/dp/B083L898MC/ref=sr_1_1?__mk_ja_JP=カタカナ&dchild=1&keywords=部屋キャン&qid=1588701547&sr=8-1", shouldCopyToPasteboard: true), urlString: "https://www.amazon.co.jp/dp/B083L898MC"))),
            ("agen -nc  https://www.amazon.co.jp/『みゃー姉が何いってるかわかんない』/dp/B07MDL9WVM/ref=sr_1_1?__mk_ja_JP=カタカナ&dchild=1&keywords=ワタてん&qid=1588701686&sr=8-1", .shortenURLString(.init(settings: .init(originalURLString: "https://www.amazon.co.jp/『みゃー姉が何いってるかわかんない』/dp/B07MDL9WVM/ref=sr_1_1?__mk_ja_JP=カタカナ&dchild=1&keywords=ワタてん&qid=1588701686&sr=8-1", shouldCopyToPasteboard: false), urlString: "https://www.amazon.co.jp/dp/B07MDL9WVM"))),
        ]
        
        for testCase in testCases {
            do {
                let result = try Parser().parse(testCase.command.components(separatedBy: " "))
                XCTAssertEqual(result, testCase.expected)
                
            } catch {
                XCTFail()
            }
        }
        
    }
    
    func testParsingError() {
        
        typealias TestCase = (command: String, expected: Parser.ParsingError)
        let testCases: [TestCase] = [
            ("agen", .urlStringNotFound(arguments: ["agen"])),
            ("agen -hv", .invalidOption("-hv")),
            ("agen -nc", .urlStringNotFound(arguments: ["agen", "-nc"])),
            ("agen abc def", .invalidArguments(["def"])),
            ("agen abc def -nc", .invalidArguments(["def", "-nc"])),
        ]
        
        for testCase in testCases {
            do {
                _ = try Parser().parse(testCase.command.components(separatedBy: " "))
                XCTFail()
                
            } catch let error as Parser.ParsingError {
                XCTAssertEqual(error, testCase.expected)
                
            } catch {
                XCTFail()
            }
        }
        
    }
    
    func testAmazonLinkValidationError() {
        
        typealias TestCase = (command: String, expected: AmazonLinkUtility.LinkStringValidationError)
        let testCases: [TestCase] = [
            ("agen -nc abc", .linkStringHasNoScheme(linkURL: URL(string: "abc")!)),
            ("agen www.crazism.net", .linkStringHasNoScheme(linkURL: URL(string: "www.crazism.net")!)),
            ("agen https://www.crazism.net", .linkIsNotFromAmazon(linkURL: URL(string: "https://www.crazism.net")!)),
            ("agen https://www.amazon.com", .linkIsFromAmazonButHasNoProduct(linkURL: URL(string: "https://www.amazon.com")!)),
        ]
        
        for testCase in testCases {
            do {
                _ = try Parser().parse(testCase.command.components(separatedBy: " "))
                XCTFail()
                
            } catch let error as AmazonLinkUtility.LinkStringValidationError {
                XCTAssertEqual(error, testCase.expected)
                
            } catch {
                XCTFail()
            }
        }
        
    }
    
}
