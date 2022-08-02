//
//  SchoolModel.swift
//  20220801-RahulKamra-NYCSchools
//
//  Created by Rahul Kamra on 01/08/22.
//

import Foundation

struct School: Codable {
    let schoolName: String
    let totalStudents: String?
    let averageMathScore: String?
    let dbName: String
    
    enum CodingKeys: String, CodingKey {
        case schoolName = "school_name"
        case totalStudents = "total_students"
        case averageMathScore = "sat_math_avg_score"
        case dbName = "dbn"
    }
}
