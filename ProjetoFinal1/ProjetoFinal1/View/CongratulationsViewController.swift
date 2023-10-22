//
//  CongratulationsViewController.swift
//  ProjetoFinal1
//
//  Created by Marco Antonio on 17/10/23.
//

import UIKit

class CongratulationsViewController: UIViewController {
    
    lazy var congratsLabel: UILabel = {
     
            let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .darkGray
        label.text = "Congratulations!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()

    override func viewDidLoad() {
        view.backgroundColor = .white
        setupView()
    }
    
    
    
    func setupView(){
        view.addSubview(congratsLabel)
        setupConstraints()
    }
    
    
    
    func setupConstraints(){
        let constraints = [
            congratsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            congratsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    
}
