//
//  REST.swift
//  DesafioABI
//
//  Created by Bruno on 26/11/20.
//  Copyright © 2020 Bruno. All rights reserved.
//

import Foundation

// Um enum que traz todos os casos de erro possível ao carregar minha API Guest

enum ItemError {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

// Aqui começo a trazer a API, faze-lo em um .swift separado me ajuda a manter a Controller principal da listagem um pouco mais limpa chamando somente o loadItem para exibir a listagem.

class loadItem {
    
    private static let basePath = "https://private-8f4dda-testeabi.apiary-mock.com/produtos"
    
    /* private static let configuration: URLSessionConfiguration = {
        
        let config = URLSessionConfiguration.default
        config.
        
    } */
    
    private static let session = URLSession.shared
    
    class func loadItems(onComplete: @escaping ([Item]) -> Void, onError: @escaping  (ItemError) -> Void)
    {
        guard let url = URL(string: basePath) else {
            onError(.url)
            return
            
        }
        //Tratamento de erro de carregamento
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?)
            in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else {return}
                    do {
                        let items = try JSONDecoder().decode([Item].self, from: data)
                        onComplete(items)
                } catch {
                        print(error.localizedDescription)
                    }
                }else {
                    print ("Erro ao carregar")
                onError(.responseStatusCode(code: response.statusCode))
                }
            } else {
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }
}



