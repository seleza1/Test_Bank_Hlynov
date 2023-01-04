//
//  BiographyViewController.swift
//  Test_Bank_Hlynov
//
//  Created by user on 28.11.2022.
//

import UIKit

final class BiographyViewController: UIViewController {
    
    @IBOutlet var backButton: UIButton!
    @IBOutlet var viewDescription: UIView!
    @IBOutlet var nameLabelArtist: UILabel!
    @IBOutlet var imageViewArtist: UIImageView!
    @IBOutlet var bioLabel: UILabel!
    
    private let searchController = UISearchController()
    private let networkManager = NetworkManager()
    private var artist: Artist?
    private var bio: Bio?
    private var searchBarText: String = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        viewDescription.isHidden = true
        navigationItem.hidesBackButton = true
        bioLabel.adjustsFontSizeToFitWidth = false
        bioLabel.lineBreakMode = .byWordWrapping

    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        viewDescription.isHidden = false
        searchController.dismiss(animated: true)
        
        networkManager.fetch(Artist.self, artistName: searchBarText) { [weak self] result in
            switch result {
            case .success(let jsonResponse):
                self?.artist = jsonResponse
                self?.nameLabelArtist.text = self?.artist?.name
                self?.bioLabel.text = self?.artist?.bio.summary
                self?.imageViewArtist.image = UIImage(named: "Star")
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @IBAction func abackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupSearchController() {
        
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Кого ищем?"
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
    
    }
}

extension BiographyViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBarText = searchText
    }
}
