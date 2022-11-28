//
//  ViewController.swift
//  Test_Bank_Hlynov
//
//  Created by user on 28.11.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var tracks: [Tracks] = []
    
    let networkManeger = NetworkManager()
    
    @IBOutlet var biographyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}


