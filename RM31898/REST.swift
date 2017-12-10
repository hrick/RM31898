//
//  REST.swift
//  RM31898
//
//  Created by Admin on 10/12/17.
//  Copyright © 2017 FiapAluno. All rights reserved.
//

import Foundation
import UIKit

class REST {
    
    static let basePath = "https://api.punkapi.com/v2/beers"
    
    static let configuration: URLSessionConfiguration = {
        
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = true
        config.timeoutIntervalForRequest = 45.0
        config.httpMaximumConnectionsPerHost = 5
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        
        
        return config
    }()
    
    static let session = URLSession(configuration: configuration)
    
    
    //CARREGANDO CERVEJAS
    static func carregarCervejas(onComplete: @escaping ([Cerveja]?) -> Void) {
        
        guard let url = URL(string: basePath) else {
            onComplete(nil)
            return
        }
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil {
                print("Erro")
                onComplete(nil)
            } else {
                
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                
                if response.statusCode == 200 {
                    
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
                        
                        var cervejas: [Cerveja] = []
                        for item in json {
                            let urlImagem = item["image_url"] as! String
                            let nome = item["name"] as! String
                            let tagLine = item["tagline"] as! String
                            let teorAlcoolico = item["abv"] as? Double
                            let escalaAmargor = item["ibu"] as? Double
                            let descricao = item["description"] as! String
                            
                            let cerveja = Cerveja(urlImagem: urlImagem, nome: nome, tagLine: tagLine, teorAlcoolico: teorAlcoolico, escalaAmargor: escalaAmargor, descricao: descricao)
                            
                            cervejas.append(cerveja)
                        }
                        onComplete(cervejas)
                        
                    } catch {
                        print(error.localizedDescription)
                        onComplete(nil)
                    }
                    
                    
                } else {
                    print("Erro no servidor:", response.statusCode)
                    onComplete(nil)
                }
                
                
                
            }
            
        }
        
        dataTask.resume()
        print("FIM")
    }
    
    
    
    static func downloadImage(url: String, onComplete: @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: url) else {
            onComplete(nil)
            return
        }
        
        session.downloadTask(with: url) { (imageURL: URL?, response: URLResponse?, error: Error?) in
            
            if let response = response as? HTTPURLResponse, response.statusCode == 200, let imageURL = imageURL {
                
                let imageData = try! Data(contentsOf: imageURL)
                let image = UIImage(data: imageData)
                onComplete(image)
                
            } else {
                onComplete(nil)
            }
            
            }.resume()
        
    }
    
    
}
