//
//  SchoolDetailViewModel.swift
//  20220801-RahulKamra-NYCSchools
//
//  Created by Rahul Kamra on 01/08/22.
//

import Foundation

protocol SchoolDetailViewModelProtocol {
    func fetchSchoolDetail()
    var errorMessage: Container<String?> { get }
    var reloadUI: Container<Bool> { get }
}

class SchoolDetailViewModel: SchoolDetailViewModelProtocol {
    
    let service: ServiceProtocol
    let dbname: String
    var school: School?
    var errorMessage = Container<String?>(value: nil)
    var reloadUI = Container<Bool>(value: false)

    init(dbname: String, service: ServiceProtocol = SchoolService()) {
        self.service = service
        self.dbname = dbname
    }
    
    func fetchSchoolDetail() {
        service.fetchSchoolDetail(dbname) { (_ result: Result<[School], Error>) in
            switch result {
            case .success(let model):
                if model.count == 0 { return }
                self.school = model.first!
                self.reloadUI.value = true
            case .failure(let error):
                self.errorMessage.value = error.localizedDescription
            }
        }
    }

}
