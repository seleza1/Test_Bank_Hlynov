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
    var isGradientAdded: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManeger.getTrack()
        
    }
}

extension UIButton {
    func applyGradient() {
        let gradient = CAGradientLayer()
        gradient.colors
    }
}


