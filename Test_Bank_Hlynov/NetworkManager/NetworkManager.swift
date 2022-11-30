//
//  NetworkManager.swift
//  Test_Bank_Hlynov
//
//  Created by user on 28.11.2022.
//

import UIKit

final class NetworkManager: UIViewController {
    
    func getArtist(url: String, completion: @escaping(Result<Artist, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error { completion(.failure(error)) }
            guard let data else { return }
            
            String(data: data, encoding: .utf8).map { print($0) }
            
            do {
                let json = try JSONDecoder().decode(JsonResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(json.artist))
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func getBestTrack(url: String, completion: @escaping(Result<[Track], Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error { completion(.failure(error)) }
            guard let data else { return }
            
            String(data: data, encoding: .utf8).map { print($0) }
            
            do {
                let json = try JSONDecoder().decode(GetResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(json.toptracks.track))
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
