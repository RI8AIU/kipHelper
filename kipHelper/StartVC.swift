//
//  StartVC.swift
//  kipHelper
//
//  Created by Андрей Поморцев on 09.06.2022.
//

import UIKit

class StartVC: UITableViewController {
    
    private let logo: UIImageView = {
        let image = UIImage(named: "logo.png")
        let imageView = UIImageView(image: image)
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setConstraints()
    }
    
    func setNavBar() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.addSubview(logo)
        
    }
    
    func setConstraints() {
        logo.translatesAutoresizingMaskIntoConstraints = false
        let aspectRatio = logo.bounds.height / logo.bounds.width
        guard let navBar = navigationController?.navigationBar else  { return }
        
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: navBar.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: navBar.centerYAnchor),
            logo.widthAnchor.constraint(lessThanOrEqualTo: navBar.heightAnchor, multiplier: 2.3),
            logo.heightAnchor.constraint(equalTo: logo.widthAnchor, multiplier: aspectRatio)
            
            
        ])
    }


}

