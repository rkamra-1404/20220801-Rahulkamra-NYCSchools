//
//  SchoolDetailModelTests.swift
//  20220801-RahulKamra-NYCSchoolsTests
//
//  Created by Rahul Kamra on 01/08/22.
//

import XCTest
@testable import _0220801_RahulKamra_NYCSchools

class SchoolDetailModelTests: XCTestCase {
    
    func testJSONMapping() throws {
        let data = StubGenerator().stubAcronyms("SchoolDetailMock")

        XCTAssertEqual(data.count, 1)
        XCTAssertEqual(data.first!.averageMathScore, "488")
    }
}
