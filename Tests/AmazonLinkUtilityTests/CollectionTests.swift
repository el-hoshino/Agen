//
//  CollectionTests.swift
//  
//
//  Created by 史 翔新 on 2020/05/06.
//

import XCTest
@testable import AmazonLinkUtility

final class CollectionTests: XCTestCase {
    
    func testElementBeforeLast() {
        
        typealias TestCase = (array: [Int], answer: Int?)
        let testCases: [TestCase] = [
            ([1], nil),
            ([1, 2], 1),
            ([1, 2, 3], 2),
        ]
        
        for testCase in testCases {
            XCTAssertEqual(testCase.array.elementBeforeLast, testCase.answer)
        }
        
    }
    
}
