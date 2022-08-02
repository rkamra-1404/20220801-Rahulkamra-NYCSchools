//
//  SchoolCell.swift
//  20220801-RahulKamra-NYCSchools
//
//  Created by Rahul Kamra on 01/08/22.
//

import UIKit

class SchoolCell: UITableViewCell {
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 20
        return view
    }()
    
    lazy var schoolNameLabel: UILabel = {
       var label = UILabel()
       label.textColor = .black
       label.translatesAutoresizingMaskIntoConstraints = false
       label.font = UIFont.systemFont(ofSize: 15)
       label.numberOfLines = 0
      return label
    }()
    
    lazy var studentCountLabel: UILabel = {
       var label = UILabel()
       label.textColor = .black
       label.translatesAutoresizingMaskIntoConstraints = false
       label.font = UIFont.systemFont(ofSize: 12)
       label.numberOfLines = 0
      return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setUpLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func setUpLayout() {
        stackView.addArrangedSubview(schoolNameLabel)
        stackView.addArrangedSubview(studentCountLabel)
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0)
        ])
        
    }
    
    
    func setUp(_ school: School) {
        self.studentCountLabel.text = "Total Students: " + (school.totalStudents ?? "")
        self.schoolNameLabel.text = school.schoolName
    }
    
}
