//
//  DogsViewController.swift
//  ProjetoFinal1
//
//  Created by Marco Antonio on 17/10/23.
//

import UIKit
import PINRemoteImage

class DogsViewController: UIViewController {
    
    
    
    @IBOutlet weak var dogButton: UIButton!
    @IBOutlet weak var dogImageView: UIImageView!
    
    var viewModel = ViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    
    func setImage(url: String){
        dogImageView.pin_setImage(from: URL(string: url))
    }
    
    
    func setupView(){
        dogButton.setTitle("Random Dogs", for: .normal)
        dogButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        viewModel.delegate = self
    }
    
    @objc func buttonAction(){
        DispatchQueue.main.async {
            self.viewModel.fatchDog()
            
        }
    }
}

extension DogsViewController: ViewModelDelegate {
    func updateURL(url: String) {
        setImage(url: url)
    }
}
