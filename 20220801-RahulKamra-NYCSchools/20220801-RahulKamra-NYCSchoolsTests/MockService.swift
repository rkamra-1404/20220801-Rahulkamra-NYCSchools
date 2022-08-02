//
//  MockService.swift
//  20220801-RahulKamra-NYCSchoolsTests
//
//  Created by Rahul Kamra on 01/08/22.
//

import Foundation
@testable import _0220801_RahulKamra_NYCSchools

class MockSchoolService: ServiceProtocol {
    
    var isFetchSchoolsCalled = false
    var isFetchSchoolDetailCalled = false
    
    func fetchSchools<T: Decodable>(handler: @escaping completion<T>) {
        isFetchSchoolsCalled = true
        let data = StubGenerator().stubAcronyms("SchoolMock") as! T
        handler(.success(data))
    }
    
    func fetchSchoolDetail<T: Decodable>(_ schoolName: String, handler: @escaping completion<T>) {
        isFetchSchoolDetailCalled = true
        let data = StubGenerator().stubAcronyms("SchoolDetailMock") as! T
        handler(.success(data))
    }

    
    
}

class MockSchoolErrorService: ServiceProtocol {
    
    var isFetchSchoolsCalled = false
    var isFetchSchoolDetailCalled = false
    
    func fetchSchools<T: Decodable>(handler: @escaping completion<T>) {
        isFetchSchoolsCalled = true
        handler(.failure(NSError(domain: "Something went wrong", code: 404, userInfo: nil)))
    }
    
    func fetchSchoolDetail<T: Decodable>(_ schoolName: String, handler: @escaping completion<T>) {
        isFetchSchoolDetailCalled = true
        handler(.failure(NSError(domain: "Something went wrong", code: 404, userInfo: nil)))
    }
    
}
