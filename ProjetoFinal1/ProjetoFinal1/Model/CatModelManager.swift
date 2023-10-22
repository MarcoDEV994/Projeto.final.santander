//
//  ModelManager.swift
//  ProjetoFinal1
//
//  Created by Marco Antonio on 19/10/23.
//

import Foundation

class CatModelManager {
    


    
    func fatchCat(with url: URL, completion: @escaping (String) -> Void ){
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, respnose, error in
            if error != nil {
                print (error!.localizedDescription)
                return
            }
            if let safeData = data, let model = self.parseJSONCat(modelData: safeData) {
                completion(model.url)
            }
        }
        task.resume()
    }
    
    func parseJSONCat(modelData: Data) -> Model? {
        let decoder = JSONDecoder()
        
        do {
            let decodeData = try decoder.decode([Model].self, from: modelData)
            let model = Model(url: decodeData[0].url)
            return model
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
