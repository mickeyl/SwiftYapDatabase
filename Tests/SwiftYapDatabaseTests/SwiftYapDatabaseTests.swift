import XCTest
@testable import YapDatabase
@testable import SwiftYapDatabase

final class SwiftYapDatabaseTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let url = URL(fileURLWithPath: "/tmp/foo.db")
        let db = YapDatabase(url: url)!
        let conn = db.newConnection()
        let inObject = NSDate()
        conn.readWrite { t in
            t.setObject( inObject, forKey: "someKey", inCollection: "someCollection")
        }
        var outObject: NSDate?
        conn.read { t in
            outObject = t.object(forKey: "someKey", inCollection: "someCollection") as? NSDate
        }
        XCTAssertEqual(inObject, outObject)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
