//
//  SchoolListViewModel.swift
//  20220801-RahulKamra-NYCSchools
//
//  Created by Rahul Kamra on 01/08/22.
//

import Foundation

protocol ListViewModelProtocol {
    func fetchSchoolList()
    var errorMessage: Container<String?> { get }
    var shouldReloadTableView : Container<Bool> { get }
    func numberOfRows(in section: Int) -> Int
    func data(for indexpath: IndexPath) -> School
    func didSelect(indexPath: IndexPath) -> School
}

class SchoolListViewModel: ListViewModelProtocol {
    let service: ServiceProtocol
    var schools: [School] = []
    var errorMessage = Container<String?>(value: nil)
    var shouldReloadTableView : Container<Bool> = Container.init(value: false)
    
    init(service: ServiceProtocol = SchoolService()) {
        self.service = service
    }
    
    
    func fetchSchoolList() {
        service.fetchSchools { (_ result: Result<[School], Error>) in
            switch result {
            case .success(let model):
                self.schools = model
                self.shouldReloadTableView.value = true
            case .failure(let error):
                self.errorMessage.value = error.localizedDescription
            }
        }
    }
    
    func numberOfRows(in section: Int) -> Int {
        return schools.count
    }

    func data(for indexpath: IndexPath) -> School {
        return schools[indexpath.row]
    }
    
    func didSelect(indexPath: IndexPath) -> School {
        return schools[indexPath.row]
    }


}
