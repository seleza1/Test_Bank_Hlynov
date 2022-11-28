//
//  NetworkManager.swift
//  Test_Bank_Hlynov
//
//  Created by user on 28.11.2022.
//

import UIKit


final class NetworkManager: UIViewController {

    func getTrack(completion: @escaping(Result<[Tracks], Error>) -> Void) {
        guard let url = URL(string: Url.urlBoigraphy) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error { completion(.failure(error)) }
            guard let data else { return }

            String(data: data, encoding: .utf8).map { print($0) }

            do {
                let json = try JSONDecoder().decode([Tracks].self, from: data)
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
    
    func getBestTrack(completion: @escaping(Result<[BestTracks], Error>) -> Void) {
        guard let url = URL(string: Url.urlBestTracks) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error { completion(.failure(error)) }
            guard let data else { return }

            String(data: data, encoding: .utf8).map { print($0) }

            do {
                let json = try JSONDecoder().decode([BestTracks].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(json))
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
}



