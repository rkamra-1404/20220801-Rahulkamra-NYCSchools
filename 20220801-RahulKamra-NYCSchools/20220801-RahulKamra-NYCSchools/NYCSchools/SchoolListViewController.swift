//
//  ViewController.swift
//  20220801-RahulKamra-NYCSchools
//
//  Created by Rahul Kamra on 01/08/22.
//

import UIKit

class SchoolListViewController: UIViewController {
    
    @IBOutlet weak var schoolsTableView: UITableView! {
        didSet {
            schoolsTableView.dataSource = self
            schoolsTableView.delegate = self
        }
    }
    
    let viewModel: ListViewModelProtocol  = SchoolListViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBindings()
        setUpUI()
        fetchSchools()
    }
    
    func fetchSchools() {
        viewModel.fetchSchoolList()
    }
    
    func setUpUI() {
        schoolsTableView.register(SchoolCell.self, forCellReuseIdentifier: "SchoolCell")
        schoolsTableView.estimatedRowHeight = 80.0
        schoolsTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupBindings() {
        bindTableViewReload()
        bindErrorHandling()
    }
    
    private func bindTableViewReload() {
        viewModel.shouldReloadTableView.bind {[weak self] (needsUpdate) in
            guard needsUpdate == true else {return}
            DispatchQueue.main.async {
                self?.schoolsTableView.isHidden = false
                //self?.indicatorView.stopAnimating()
                self?.schoolsTableView.reloadData()
            }
        }
    }
    
    private func bindErrorHandling() {
        viewModel.errorMessage.bind {[weak self] (errorMessage) in
            guard let msg = errorMessage else {
                return
            }
            DispatchQueue.main.async {
                //self?.indicatorView.stopAnimating()
                self?.showErrorMessgae(message: msg ?? "")
            }
        }
    }
    
    private func showErrorMessgae(message : String) {
        let alertController = UIAlertController.init(title: "Error", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }

}

extension SchoolListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = viewModel.data(for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolCell", for: indexPath) as! SchoolCell
        cell.setUp(cellData)
        return cell
    }
    
    
}

extension SchoolListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel.didSelect(indexPath: indexPath)
        let viewController = SchoolDetailVC.instanceFromNib()
        viewController.viewModel = SchoolDetailViewModel(dbname: data.dbName)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
