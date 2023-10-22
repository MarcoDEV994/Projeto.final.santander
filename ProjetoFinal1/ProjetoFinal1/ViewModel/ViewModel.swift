//
//  ViewModel.swift
//  ProjetoFinal1
//
//  Created by Marco Antonio on 19/10/23.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func updateURL(url: String)
}


class ViewModel{
    //var url: String = ""
    let catURL = URL(string: "https://api.thecatapi.com/v1/images/search")
    let dogURL = URL(string: "https://shibe.online/api/shibes?count=1&urls=true&httpsUrls=true")
    
    var catModelManager: CatModelManager?
    var dogManager: DogManager?
    
    weak var delegate: ViewModelDelegate?
    
    init(catModelManager: CatModelManager? = CatModelManager(), dogManager: DogManager? = DogManager()) {
        self.catModelManager = catModelManager
        self.dogManager = dogManager
    }
    

    
    func fatchCat(){
        if let catURL = catURL{
            catModelManager!.fatchCat(with: catURL, completion: { url in
                //self.url = url
                self.delegate?.updateURL(url: url)
            })
        }
    }
    
    
    func fatchDog(){
        if let dogURL = dogURL{
            dogManager?.fatchDog(with: dogURL, completion: { url in
                //self.url = url
                self.delegate?.updateURL(url: url)

            })
        }
    }
}
