import XCTest
@testable import AgenLib

final class URLTests: XCTestCase {
    
    func testRawStringInit() {
        
        let urlString = "https://www.amazon.co.jp/三体-劉-慈欣-ebook/dp/B07TS9XTSD?pf_rd_r=3NM4X76VWX1RJ8M1KNSZ&pf_rd_p=8dd8d7ad-c1f3-48a6-946c-515274852690&pd_rd_r=2aee8946-94b9-4b68-9447-b2098c180d2a&pd_rd_w=buoYG&pd_rd_wg=evr2g&ref_=pd_gw_rnn"
        
        let url = URL(rawString: urlString)
        
        XCTAssertEqual(url?.absoluteString, "https://www.amazon.co.jp/%E4%B8%89%E4%BD%93-%E5%8A%89-%E6%85%88%E6%AC%A3-ebook/dp/B07TS9XTSD?pf_rd_r=3NM4X76VWX1RJ8M1KNSZ&pf_rd_p=8dd8d7ad-c1f3-48a6-946c-515274852690&pd_rd_r=2aee8946-94b9-4b68-9447-b2098c180d2a&pd_rd_w=buoYG&pd_rd_wg=evr2g&ref_=pd_gw_rnn")
        
    }
    
    func testSchemeHostPathInit() {
        
        let url = URL(scheme: "https", host: "www.amazon.co.jp", path: ["dp", "B07TS9XTSD"])
        
        XCTAssertEqual(url?.absoluteString, "https://www.amazon.co.jp/dp/B07TS9XTSD")
        
    }
    
    static var allTests = [
        ("testRawStringInit", testRawStringInit),
        ("testSchemeHostPathInit", testSchemeHostPathInit),
    ]
}
