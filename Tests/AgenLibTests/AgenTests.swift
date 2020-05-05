import XCTest
@testable import Agen

final class AgenTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Agen().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
