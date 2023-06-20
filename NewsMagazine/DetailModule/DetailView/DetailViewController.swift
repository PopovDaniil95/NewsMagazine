//
//  DetailViewController.swift
//  NewsMagazine
//
//  Created by Даниил Попов on 12.06.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    let imageView = UIImageView()
    
    let titleLabel: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 0
        lable.font = .systemFont(ofSize: 18, weight: .bold)
        return lable
    }()
    
    let descriptionLable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 0
        lable.font = .systemFont(ofSize: 16, weight: .medium)
        return lable
    }()
    
    var presenter: DetailViewPresenterProtocol!
    weak var mainVC: CustomTableViewCellModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.traitCollection.userInterfaceStyle == .dark {
            navigationItem.backBarButtonItem?.tintColor = .black
            view.backgroundColor = .black
        } else {
            view.backgroundColor = .white
            navigationItem.backBarButtonItem?.tintColor = .white
        }
        
        createElementsForView()
        presenter.setDescription()
    }
    
    func createElementsForView() {
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLable)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLable.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

            descriptionLable.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            descriptionLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
    
}

extension DetailViewController: DetailViewProtocol {
    func setDescription(viewModule: CustomTableViewCellModel) {
        titleLabel.text = viewModule.title
        imageView.image = UIImage(data: viewModule.imageData ?? Data())
        descriptionLable.text = viewModule.subtitle
    }
    
    
    
    
}
