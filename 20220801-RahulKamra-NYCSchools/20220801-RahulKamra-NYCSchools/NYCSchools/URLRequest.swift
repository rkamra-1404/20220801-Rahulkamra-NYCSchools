//
//  URLRequest.swift
//  20220801-RahulKamra-NYCSchools
//
//  Created by Rahul Kamra on 01/08/22.
//

import Foundation

protocol UrlRequestProtocol {
    var urlRequest: URLRequest? { get }
    var headers: [String: String] { get }
}

enum RequestProvider: UrlRequestProtocol {
    case schoolList
    case schoolDetail(String)
    
    var headers: [String : String] {
        return ["X-App-Token": appToken]
    }
    
    private var appToken: String {
        return "HSz0GCD4OppfEyJh3CoZ8sk9d"
    }
    
    private var url: URL? {
        switch self {
        case .schoolList:
            let urlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
            return URL(string: urlString)
        case .schoolDetail(let dbname):
//            let schoolName = schoolName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let urlString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(dbname)"
            return URL(string: urlString)
        }
        
        
    }
    
    var urlRequest: URLRequest? {
        guard let url = url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(appToken, forHTTPHeaderField: "X-App-Token")
        return request
    }
    
    
}
