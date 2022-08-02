//
//  SchoolDetailViewModelTests.swift
//  20220801-RahulKamra-NYCSchoolsTests
//
//  Created by Rahul Kamra on 01/08/22.
//

import XCTest
@testable import _0220801_RahulKamra_NYCSchools

class SchoolDetailViewModelTests: XCTestCase {
    
    var sut: SchoolDetailViewModel!
    var mockAPIService: MockSchoolService!
    var mockApiFailService: MockSchoolErrorService!
    
    override func setUp() {
            super.setUp()
            mockAPIService = MockSchoolService()
            mockApiFailService = MockSchoolErrorService()
        }
        
        override func tearDown() {
            sut = nil
            mockAPIService = nil
            mockApiFailService = nil
            super.tearDown()
        }
    
    func test_fetch_Data() {
        sut = SchoolDetailViewModel(dbname: "", service: mockAPIService)
        sut.fetchSchoolDetail()
            // Assert
            XCTAssertTrue(mockAPIService!.isFetchSchoolDetailCalled)
        }
    
    func test_create_view_model_data() {
        sut = SchoolDetailViewModel(dbname: "", service: mockAPIService)
        let expect = XCTestExpectation(description: "reload closure triggered")
        sut.reloadUI.bind(withHandler: { shouldReload in
            expect.fulfill()
        })
                
                // When
                sut.fetchSchoolDetail()
                
        XCTAssertEqual( sut.school?.averageMathScore, "488")
                
                // XCTAssert reload closure triggered
                wait(for: [expect], timeout: 1.0)
        }
    
    func test_fail_create_view_model_array() {
        sut = SchoolDetailViewModel(dbname: "", service: mockApiFailService)
        let expect = XCTestExpectation(description: "error message closure triggered")
        sut.errorMessage.bind { error in
            expect.fulfill()
        }
        
        // When
        sut.fetchSchoolDetail()
        XCTAssertEqual(sut.errorMessage.value, "The operation couldn’t be completed. (Something went wrong error 404.)")
        wait(for: [expect], timeout: 1.0)

    }

}

