//
//  BestTrackViewController.swift
//  Test_Bank_Hlynov
//
//  Created by user on 28.11.2022.
//

import UIKit

final class BestTrackViewController: UIViewController {
        
    let searchController = UISearchController()
    let networkManager = NetworkManager()
    
    @IBOutlet var bestTrackLabel: UILabel!
    @IBOutlet var imageViewBestTrack: UIImageView!
    @IBOutlet var viewBestTracks: UIView!
    @IBOutlet var backButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        setupBackButton()
        navigationItem.hidesBackButton = true
        viewBestTracks.isHidden = true
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        viewBestTracks.isHidden = false
    }
    
    private func setupSearchController() {
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Кого ищем?"
        //searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    private func setupBackButton() {
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

/*extension BestTrackViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let urlBestTracks: String =  "http://ws.audioscrobbler.com/2.0/?method=artist.gettoptracks&artist=\(searchText)&api_key=f6b4b86d30378ca8d9f43b560d10cdfe&format=json"
        networkManager.getBestTracks(url: urlBestTracks) { [weak self] result in
            switch result {
                
            case .success(let jsonResponse):
                self?.topTracks = jsonResponse.track.name
                self?.bestTrackLabel.text = self?.topTracks?
                self?.imageViewBestTrack.image = UIImage(named: "1")
                
            case .failure(let error):
                print(error)
            }
        }
    }
}*/
