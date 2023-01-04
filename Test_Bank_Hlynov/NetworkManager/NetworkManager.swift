//
//  NetworkManager.swift
//  Test_Bank_Hlynov
//
//  Created by user on 28.11.2022.
//

import UIKit

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager: UIViewController {
    
    func fetch<T: Decodable>(_ type: T.Type, artistName: String, completion: @escaping(Result<T, NetworkError>) -> Void) {
        var urlBiography: String =  "http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=\(artistName)&api_key=f6b4b86d30378ca8d9f43b560d10cdfe&format=json"

        urlBiography.replace(" ", with: "+")
        guard let url = URL(string: urlBiography) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil { completion(.failure(.noData)) }
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            String(data: data, encoding: .utf8).map { print($0) }
            
            do {
                let type = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(type))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func getBestTrack(artistName: String, completion: @escaping(Result<[Track], NetworkError>) -> Void) {
        var urlString: String =  "http://ws.audioscrobbler.com/2.0/?method=artist.gettoptracks&artist=\(artistName)&api_key=f6b4b86d30378ca8d9f43b560d10cdfe&format=json"
        
        urlString.replace(" ", with: "+")
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
         }
                
        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil { completion(.failure(.invalidURL)) }
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            String(data: data, encoding: .utf8).map { print($0) }
            
            do {
                let json = try JSONDecoder().decode(GetBestTracks.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(json.toptracks.track))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
