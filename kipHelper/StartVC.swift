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
    
    private let cellID = "cell"
    
    private let titles = Title.getTitle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setConstraints()
        setTableView()
        
    }
    
    func setTableView() {
        tableView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.rowHeight = 100
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellID)
        
    }
    
    func setNavigationBar() {
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

extension StartVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Повторное использование ячейки с инденитфикатором cellID
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CustomCell
        cell.title.text = titles[indexPath.row].value
        cell.icon.image = UIImage(named: titles[indexPath.row].value!)

        return cell
    }
    
}
