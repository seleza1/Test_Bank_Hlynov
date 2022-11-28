//
//  ViewController.swift
//  Test_Bank_Hlynov
//
//  Created by user on 28.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    let searchController = UISearchController()
    
    var welcome: [Welcome] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationTitle("Поиск музыкальных исполнителей")
        navigationItem.searchController = searchController
        getTrack()

        
    }
    private func configureNavigationTitle(_ title: String) {
            let tempLabel = UILabel()
        
        tempLabel.font = UIFont.systemFont(ofSize: 100, weight: .bold)
            tempLabel.text = "Поиск музыкальных исполнителей"

            if tempLabel.intrinsicContentSize.width > UIScreen.main.bounds.width - 30 {
                var currentTextSize: CGFloat = -1
                for _ in 1 ... 100 {
                    currentTextSize -= 100
                    tempLabel.font = UIFont.systemFont(ofSize: currentTextSize, weight: .bold)
                    if tempLabel.intrinsicContentSize.width < UIScreen.main.bounds.width - 50 {
                        break
                    }
                }
                navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: currentTextSize, weight: .bold)]
            }
            self.title = title
        }
    
    private func getTrack() {
        guard let url = URL(string: Url.url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let error, let response, let data else { return }
            
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


}



