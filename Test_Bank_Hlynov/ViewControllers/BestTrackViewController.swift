//
//  BestTrackViewController.swift
//  Test_Bank_Hlynov
//
//  Created by user on 28.11.2022.
//

import UIKit

final class BestTrackViewController: UIViewController {
    @IBOutlet var backButton: UIButton!
        
    let searchController = UISearchController()
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        setupBackButton()
        navigationItem.hidesBackButton = true
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
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
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16.0),
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.underlineStyle:1.0
        ])
        backButton.setAttributedTitle(attributedString, for: .normal)
        self.view.addSubview(backButton)
    }
}

extension BestTrackViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
