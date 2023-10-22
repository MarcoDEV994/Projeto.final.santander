//
//  ModelManager.swift
//  ProjetoFinal1
//
//  Created by Marco Antonio on 19/10/23.
//

import Foundation

class DogManager {
    
    
    
    
    func fatchDog(with url: URL, completion: @escaping (String) -> Void ){
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, respnose, error in
            if error != nil {
                print (error!.localizedDescription)
                return
            }
            if let safeData = data, let model = self.parseJSON(modelData: safeData) {
                completion(model[0])
            }
        }
        task.resume()
        
    }
    
    func parseJSON(modelData: Data) -> [String]? {
        let decoder = JSONDecoder()
        
        do {
            let decodeData = try decoder.decode([String].self, from: modelData)
            return decodeData
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

