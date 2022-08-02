//
//  SchoolDetailVC.swift
//  20220801-RahulKamra-NYCSchools
//
//  Created by Rahul Kamra on 01/08/22.
//

import UIKit

class SchoolDetailVC: UIViewController {
    
    @IBOutlet weak var satScoreLabel: UILabel!
    @IBOutlet weak var otherDetailLabel: UILabel!
    
    var viewModel: SchoolDetailViewModel?
    
    static func instanceFromNib() -> SchoolDetailVC {
        let vc = UINib(nibName: "SchoolDetailVC", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! SchoolDetailVC
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
        bindUI()
    }
    
    func fetchData() {
        viewModel?.fetchSchoolDetail()
    }
    
    private func bindUI() {
        viewModel?.reloadUI.bind {[weak self] (needsUpdate) in
            guard needsUpdate == true else {return}
            DispatchQueue.main.async {
                self?.updateUI()
            }
        }
    }
    
    private func updateUI() {
        self.satScoreLabel.text = viewModel?.school?.averageMathScore ?? ""
        self.otherDetailLabel.text = "School Name: " + (viewModel?.school?.schoolName ?? ""
        )
    }
    
    
}
