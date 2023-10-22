//
//  TabViewController.swift
//  ProjetoFinal1
//
//  Created by Marco Antonio on 17/10/23.
//

import UIKit


class TabViewController: UITabBarController, UITabBarControllerDelegate{
    
    let catsViewController = CatsViewController()
    let dogsViewController = DogsViewController()
    let congratsViewController = CongratulationsViewController()
    
    override func loadView() {
        super.loadView()
        catsViewController.title = "Cats"
        dogsViewController.title = "Dogs"
        congratsViewController.title = "Click me"
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .darkGray
        tabBar.isTranslucent = false
        
        self.setViewControllers([catsViewController,dogsViewController,congratsViewController], animated: false)
        
        guard let items = self.tabBar.items else { return }
        let images = ["pawprint.circle.fill","pawprint.circle.fill","heart.circle.fill"]
        
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
        }
    }
}
