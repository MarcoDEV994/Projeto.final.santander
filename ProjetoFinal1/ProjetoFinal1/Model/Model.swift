//
//  CarModel.swift
//  ProjetoFinal1
//
//  Created by Marco Antonio on 19/10/23.
//

import Foundation

struct Model: Codable {
    let url: String
    
    init(url: String) {
        self.url = url
    }
}
