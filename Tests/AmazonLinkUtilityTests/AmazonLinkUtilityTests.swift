//
//  AmazonLinkUtilityTests.swift
//  
//
//  Created by 史 翔新 on 2020/05/06.
//

import XCTest
@testable import AmazonLinkUtility

final class AmazonLinkUtilityTests: XCTestCase {
    
    func testValidLinks() {
        
        let utility = AmazonLinkUtility()
        
        typealias TestCase = (original: String, shorten: String)
        let testCases: [TestCase] = [
            ("https://www.amazon.co.jp/「早坂愛は防ぎたい」「生徒会は神ってない」「かぐや様は結婚したい」「かぐや様は祝いたい」/dp/B086ZCTDJ8/ref=sr_1_1?__mk_ja_JP=カタカナ&dchild=1&keywords=かぐや様&qid=1588694541&sr=8-1",
             "https://www.amazon.co.jp/dp/B086ZCTDJ8"),
            
            ("https://www.amazon.co.jp/gp/product/B083JL3TFN/ref=ppx_yo_dt_b_d_asin_title_o00?ie=UTF8&psc=1",
             "https://www.amazon.co.jp/gp/product/B083JL3TFN"),
        ]
        
        for testCase in testCases {
            XCTAssertEqual(try utility.shortenLinkString(of: testCase.original), testCase.shorten)
        }
        
    }
    
    func testInvalidLinks() {
        
        typealias TestCase = (link: String, error: AmazonLinkUtility.LinkStringValidationError)
        let testCases: [TestCase] = [
            ("", .linkStringIsNotURL(linkString: "")),
            ("www.crazism.net", .linkStringHasNoScheme(linkURL: URL(string: "www.crazism.net")!)),
            ("https://www.crazism.net", .linkIsNotFromAmazon(linkURL: URL(string: "https://www.crazism.net")!)),
            ("https://www.amazon.com", .linkIsFromAmazonButHasNoProduct(linkURL: URL(string: "https://www.amazon.com")!)),
        ]
        
        let utility = AmazonLinkUtility()
        
        for testCase in testCases {
            XCTAssertThrowsError(try utility.shortenLinkString(of: testCase.link)) {
                XCTAssertEqual(($0 as? AmazonLinkUtility.LinkStringValidationError), testCase.error)
            }
        }
        
    }
    
}
