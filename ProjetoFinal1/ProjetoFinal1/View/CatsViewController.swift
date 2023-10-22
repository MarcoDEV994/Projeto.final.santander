//
//  CatsViewController.swift
//  ProjetoFinal1
//
//  Created by Marco Antonio on 17/10/23.
//

import UIKit
import PINRemoteImage

class CatsViewController: UIViewController {
    
    lazy var catImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart.circle.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
    lazy var catButton: UIButton = {
        let button = UIButton()
        button.setTitle("Random Cats", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .black
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()
    
    var viewModel = ViewModel()
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupView()
    }
    
    
    func setImage(url: String){
        catImageView.pin_setImage(from: URL(string: url))
    }
    
    @objc func buttonAction(){
        DispatchQueue.main.async {
            self.viewModel.fatchCat()

        }
    }
    
    func setupView(){
        view.addSubview(catImageView)
        view.addSubview(catButton)
        setupConstraints()
        viewModel.delegate = self
    }
    func setupConstraints(){
        let constraints = [
            catImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            catImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            catImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 96),
            catImageView.heightAnchor.constraint(equalToConstant: 400),
            
            catButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            catButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            catButton.heightAnchor.constraint(equalToConstant: 48),
            catButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
            ]
        NSLayoutConstraint.activate(constraints)
    }
    
}
extension CatsViewController: ViewModelDelegate {
    func updateURL(url: String) {
        self.setImage(url: url)

    }
    
    
}
