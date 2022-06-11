//
//  CustomCell.swift
//  kipHelper
//
//  Created by Андрей Поморцев on 09.06.2022.
//

import UIKit

class CustomCell: UITableViewCell {
    
    lazy var backView: UIView = {
        guard let superView = superview?.frame else { return UIView() }
        //Размеры установленны при инициализации View.
        //Так и не смог разобрать, как установит размеры при помощи NSLayoutConstraint
        let view =  UIView(frame: CGRect(x: 10, y: 10, width: superView.width - 20, height: 80))
        view.contentMode = .scaleAspectFit
        view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = view.frame.height / 2
        view.layer.borderColor = #colorLiteral(red: 0.8901960784, green: 0.8901960784, blue: 0.8901960784, alpha: 1)
        view.layer.borderWidth = 1
        
        return view
    }()
    
    lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    private func setConstraints() {
        // set constraint fot "backView"
        /*  backView.translatesAutoresizingMaskIntoConstraints = false //tamic
         NSLayoutConstraint.activate([
         //backView.centerYAnchor.constraint(equalTo: centerYAnchor)
         backView.leftAnchor.constraint(equalTo: leftAnchor, constant: 50),
         backView.rightAnchor.constraint(equalTo: rightAnchor, constant: -50),
         backView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
         backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
         
         ])*/
        
        // set constraints for "icon"
        icon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            icon.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 16),
            icon.heightAnchor.constraint(equalToConstant: 48),
            icon.widthAnchor.constraint(equalTo: icon.heightAnchor)
            
        ])
        
        // set costraints for "title"
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            title.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 32),
            title.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -32)
            
        ])
        
    }
    
    override func layoutSubviews() {
        selectedBackgroundView?.frame = backView.frame
        selectedBackgroundView?.layer.cornerRadius = backView.frame.height / 2
        
        // shadow
        selectedBackgroundView?.layer.shadowColor = UIColor.gray.cgColor
        selectedBackgroundView?.layer.shadowOpacity = 0.25
        selectedBackgroundView?.layer.shadowOffset = CGSize(width: 0, height: 0)
        selectedBackgroundView?.layer.shadowRadius = 5.0
        backgroundColor = .clear
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        backView.addSubview(icon)
        backView.addSubview(title)
        addSubview(backView)
        setConstraints()
    
    }
    
}
