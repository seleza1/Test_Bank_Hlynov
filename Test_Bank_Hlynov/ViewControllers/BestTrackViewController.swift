//
//  BestTrackViewController.swift
//  Test_Bank_Hlynov
//
//  Created by user on 28.11.2022.
//

import UIKit

final class BestTrackViewController: UIViewController {
    
    let searchController = UISearchController()
    
    private let searchBar = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController

    }

}
