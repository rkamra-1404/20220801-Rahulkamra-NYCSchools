//
//  Service.swift
//  20220801-RahulKamra-NYCSchools
//
//  Created by Rahul Kamra on 01/08/22.
//

import Foundation
import UIKit

protocol ServiceProtocol {
    func fetchSchools<T: Decodable>(handler: @escaping completion<T>)
    func fetchSchoolDetail<T: Decodable>(_ schoolName: String, handler: @escaping completion<T>)
}

class SchoolService: ServiceProtocol {
    let network: NetworkClientProtocol
    
    init(network: NetworkClientProtocol = NetworkClient()) {
        self.network = network
    }
    
    func fetchSchools<T: Decodable>(handler: @escaping completion<T>) {
        let request = RequestProvider.schoolList
        network.fetchData(request, handler: handler)
    }
    
    func fetchSchoolDetail<T: Decodable>(_ dbname: String, handler: @escaping completion<T>) {
        let request = RequestProvider.schoolDetail(dbname)
        network.fetchData(request, handler: handler)
    }
}
