//
//  NetworkManager.swift
//  Test_Bank_Hlynov
//
//  Created by user on 28.11.2022.
//

import UIKit


final class NetworkManager: UIViewController {
    
    var welcome: [Tracks] = []
    
    func getTrack(completion: @escaping(Result<[Tracks], Error>) -> Void) {
        guard let url = URL(string: Url.url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let error, let response, let data else {
                completion(.failure(error!))
                return
            }
            print(response)
            do {
                let json = try JSONDecoder().decode([Tracks].self, from: data)
                self.welcome = json
                DispatchQueue.main.async {
                    completion(.success(json))
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func fetchImage(from url: URL, completion: @escaping(Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(error!))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            DispatchQueue.main.async {
                completion(.success(data))
            }
            
        }.resume()
    }
    
}



