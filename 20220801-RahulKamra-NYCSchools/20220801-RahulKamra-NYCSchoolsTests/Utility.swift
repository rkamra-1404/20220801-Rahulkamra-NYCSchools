//
//  Utility.swift
//  20220801-RahulKamra-NYCSchoolsTests
//
//  Created by Rahul Kamra on 01/08/22.
//

import Foundation
@testable import _0220801_RahulKamra_NYCSchools

class StubGenerator {
    func stubAcronyms(_ filename: String) -> [School] {
        let path = Bundle.main.path(forResource: filename, ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let decoder = JSONDecoder()
        let schools = try! decoder.decode([School].self, from: data)
        return schools
    }
}
