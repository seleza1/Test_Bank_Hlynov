//
//  ViewController.swift
//  Test_Bank_Hlynov
//
//  Created by user on 28.11.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    
    let networkManeger = NetworkManager()
    
    @IBOutlet var biographyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navbarTitle = UILabel()
        
        navbarTitle.text = "Поиск музыкальных исполнителей"
        navbarTitle.minimumScaleFactor = 0.5
        navbarTitle.adjustsFontSizeToFitWidth = true
        navigationItem.titleView = navbarTitle
        navbarTitle.numberOfLines = 3
        navbarTitle.textAlignment = .left
        navbarTitle.font = UIFont.boldSystemFont(ofSize: 50)
        
    }
    
    
}


