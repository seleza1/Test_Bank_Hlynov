//
//  BestTrackViewController.swift
//  Test_Bank_Hlynov
//
//  Created by user on 28.11.2022.
//

import UIKit

final class BestTrackViewController: UIViewController {

    @IBOutlet var backButton: UIButton!
    @IBOutlet var tableView: UITableView!
    
    private let searchController = UISearchController()
    private var searchBarText: String = ""
    private let networkManager = NetworkManager()
    private var tracks: [Track] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        setupBackButton()
        navigationItem.hidesBackButton = true
        setupTableView()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
 
       
        networkManager.getBestTrack(artistName: searchBarText) { result in
            
            switch result {
                
            case .success(let tracks):
                let shuffledTracks = tracks.shuffled()
                self.tracks = Array(shuffledTracks.prefix(3))
                self.searchController.dismiss(animated: true)
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 95
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
        searchBarText = searchText
    }
}

extension BestTrackViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = tracks[indexPath.row].name
        content.image = UIImage(named: "Star")
        cell.contentConfiguration = content
        
        return cell
    }
}
