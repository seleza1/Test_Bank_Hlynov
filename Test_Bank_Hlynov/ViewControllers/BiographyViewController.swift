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
    
    private var artist: Artist?
    private var bio: Bio?

    let searchController = UISearchController()
    let networkManeger = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        setupBackButton()
        viewDescription.isHidden = true
        navigationItem.hidesBackButton = true
        bioLabel.adjustsFontSizeToFitWidth = false
        bioLabel.lineBreakMode = .byWordWrapping

    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        viewDescription.isHidden = false

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
    
    private func setupBackButton() {
        backButton.frame = CGRect(x: 40, y: 240, width: 320, height: 50)
        let attributedString = NSAttributedString(string: NSLocalizedString("Вернуться назад", comment: ""), attributes:[
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18.0),
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.underlineStyle:1.0
        ])
        backButton.setAttributedTitle(attributedString, for: .normal)
        self.view.addSubview(backButton)
    }
}

extension BiographyViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let urlBoigraphy: String =  "http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=\(searchText)&api_key=f6b4b86d30378ca8d9f43b560d10cdfe&format=json"
        networkManeger.getArtist(url: urlBoigraphy) { [weak self] result in
            switch result {
                
            case .success(let jsonResponse):
                self?.artist = jsonResponse.artist
                self?.nameLabelArtist.text = self?.artist?.name
                self?.bioLabel.text = self?.artist?.bio.summary
                self?.imageViewArtist.image = UIImage(named: "1")
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
