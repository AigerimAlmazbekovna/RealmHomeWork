//
//  LaunchScreenVC.swift
//  REALMHomework22
//
//  Created by Айгерим on 19.09.2024.
//

import Foundation
import UIKit

class LaunchScreenVC: UIViewController {
    
    //MARK: - UI Elements (Launch screen customization)
    
    private let logoImage: UIImageView = {
        let logoImageView = UIImageView(image: UIImage(named: "logo"))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return logoImageView
    }()

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        
    }
    
    
    //MARK: - Private
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(logoImage)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 250),
            logoImage.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
}
