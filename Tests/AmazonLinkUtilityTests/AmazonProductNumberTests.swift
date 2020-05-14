//
//  AmazonProductNumberTests.swift
//  
//
//  Created by 史 翔新 on 2020/05/06.
//

import XCTest
@testable import AmazonLinkUtility

final class AmazonProductNumberTests: XCTestCase {
    
    func testFindNumber() {
        
        typealias TestCase = (pathComponents: [String], answer: AmazonProductNumber?)
        let testCases: [TestCase] = [
            (["123", "456", "789"], nil),
            (["123", "dp", "456", "789"], .init(prefix: .dp, number: "456")),
            (["123", "gp", "product", "456", "789"], .init(prefix: .gpProduct, number: "456")),
            (["123", "gp", "456", "product", "789"], nil),
        ]
        
        for testCase in testCases {
            XCTAssertEqual(AmazonProductNumber.find(in: testCase.pathComponents), testCase.answer)
        }
        
    }
    
}
