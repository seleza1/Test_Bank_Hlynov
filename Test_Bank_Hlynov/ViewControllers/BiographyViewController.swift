//
//  BiographyViewController.swift
//  Test_Bank_Hlynov
//
//  Created by user on 28.11.2022.
//

import UIKit

final class BiographyViewController: UIViewController {
    
    @IBOutlet var backButton: UIButton!
    
    private var tracks: [Tracks] = []

    let searchController = UISearchController()
    let networkManeger = NetworkManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        fetchTrack()
    }
    
    private func fetchTrack() {
        networkManeger.getTrack { result in
            switch result {
            case .success(let track):
                self.tracks = track
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func setupSearchController() {
        
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Кого ищем?"
    }
}

extension BiographyViewController {
    
    func setupBackButton() {
        backButton.frame = CGRect(x: 40, y: 240, width: 320, height: 50)
        let attributedString = NSAttributedString(string: NSLocalizedString("Вернуться назад", comment: ""), attributes:[
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16.0),
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.underlineStyle:1.0
        ])
        backButton.setAttributedTitle(attributedString, for: .normal)
        self.view.addSubview(backButton)
    }

}
