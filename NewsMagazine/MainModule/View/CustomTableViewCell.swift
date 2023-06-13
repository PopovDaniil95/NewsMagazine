//
//  CustomTableViewCell.swift
//  NewsMagazine
//
//  Created by Даниил Попов on 11.06.2023.
//

import UIKit

class CustomTableViewCellModel {
    let title: String
    let subtitle: String
    let imageURL: URL?
    var imageData: Data? = nil
    
    init(title: String, subtitle: String, imageURL: URL?) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
    }
}

class CustomTableViewCell: UITableViewCell {
    
    var customImage = UIImageView()
    
    var customLable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 0
        lable.font = .systemFont(ofSize: 18, weight: .bold)
        return lable
    }()
  
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customLable.translatesAutoresizingMaskIntoConstraints = false
        customLable.numberOfLines = 0
        
        customImage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(customImage)
        contentView.addSubview(customLable)
        
        NSLayoutConstraint.activate([
            customImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            customImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            customImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            customImage.heightAnchor.constraint(equalToConstant: 200),
            
            customLable.topAnchor.constraint(equalTo: customImage.bottomAnchor, constant: 10),
            customLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            customLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            customLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(viewModule: CustomTableViewCellModel) {
        customLable.text = viewModule.title
        
        if let data = viewModule.imageData {
            customImage.image = UIImage(data: data)
        } else if let url = viewModule.imageURL {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else { return }
                viewModule.imageData = data
                DispatchQueue.main.async {
                    self?.customImage.image = UIImage(data: data)
                }
            }.resume()
        }
    }
    
}


