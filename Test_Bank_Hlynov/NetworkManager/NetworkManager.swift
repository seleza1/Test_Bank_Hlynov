//
//  NetworkManager.swift
//  Test_Bank_Hlynov
//
//  Created by user on 28.11.2022.
//

import UIKit

final class NetworkManager: UIViewController {
    
    var welcome: [Welcome] = []
    
     func getTrack() {
        guard let url = URL(string: Url.url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let error, let response, let data else {
                print("error")
                return
            }
            
            print(response)
            do {
                let json = try JSONDecoder().decode([Welcome].self, from: data)
                self.welcome = json
                DispatchQueue.main.async {
                    print(self.welcome)
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    private func getImage() {
        
    }
    
}



