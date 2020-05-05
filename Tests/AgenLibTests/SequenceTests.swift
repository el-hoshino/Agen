//
//  SequenceTests.swift
//  
//
//  Created by 史 翔新 on 2020/05/06.
//

import XCTest
@testable import AgenLib

final class SequenceTests: XCTestCase {
    
    func testElementsFollowing() {
        
        typealias TestCase = (array: [Int], target: (Int) -> Bool, answer: Int?)
        let testCases: [TestCase] = [
            ([1, 2, 3], { $0 == 1 }, 2),
            ([1, 2, 3], { $0 > 1 }, 3),
            ([1, 2, 3], { $0 > 2 }, nil),
        ]
        
        for testCase in testCases {
            XCTAssertEqual(testCase.array.element(following: testCase.target), testCase.answer)
        }
        
    }
    
    static var allTests = [
        ("testElementsFollowing", testElementsFollowing),
    ]
    
}
