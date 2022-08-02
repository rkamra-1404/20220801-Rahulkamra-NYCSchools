//
//  SchoolModelTests.swift
//  20220801-RahulKamra-NYCSchoolsTests
//
//  Created by Rahul Kamra on 01/08/22.
//

import XCTest
@testable import _0220801_RahulKamra_NYCSchools

class SchoolModelTests: XCTestCase {
    
    func testJSONMapping() throws {
        let data = StubGenerator().stubAcronyms("SchoolMock")

        XCTAssertEqual(data.count, 2)
        XCTAssertEqual(data.first!.dbName, "02M260")
    }
}
