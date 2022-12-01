//
//  NetworkManager.swift
//  Test_Bank_Hlynov
//
//  Created by user on 28.11.2022.
//

import UIKit

final class NetworkManager: UIViewController {
    
    func getBiography(artistName: String, completion: @escaping(Result<Artist, Error>) -> Void) {
        var urlBoigraphy: String =  "http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=\(artistName)&api_key=f6b4b86d30378ca8d9f43b560d10cdfe&format=json"
        
        urlBoigraphy.replace(" ", with: "+")
        guard let url = URL(string: urlBoigraphy) else { return }
                
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error { completion(.failure(error)) }
            guard let data else { return }
            
            String(data: data, encoding: .utf8).map { print($0) }
            
            do {
                let json = try JSONDecoder().decode(GetBiography.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(json.artist))
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func getBestTrack(artistName: String, completion: @escaping(Result<[Track], Error>) -> Void) {
        var urlString: String =  "http://ws.audioscrobbler.com/2.0/?method=artist.gettoptracks&artist=\(artistName)&api_key=f6b4b86d30378ca8d9f43b560d10cdfe&format=json"
        
        urlString.replace(" ", with: "+")
        guard let url = URL(string: urlString) else { return }
                
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error { completion(.failure(error)) }
            guard let data else { return }
            
            String(data: data, encoding: .utf8).map { print($0) }
            
            do {
                let json = try JSONDecoder().decode(GetBestTracks.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(json.toptracks.track))
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
