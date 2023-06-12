//
//  MainPresenter.swift
//  NewsMagazine
//
//  Created by Даниил Попов on 10.06.2023.
//

import Foundation
import UIKit


protocol MainViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    var news: News? { get set }
    var viewModels: [CustomTableViewCellModel] { get set }
    func getNews()
}

class MainPresenter: MainViewPresenterProtocol {
        
    weak var view: MainViewProtocol!
    let networkService: NetworkServiceProtocol!
    var news: News?
    var viewModels: [CustomTableViewCellModel] = []

    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getNews()
    }
    
    func getNews() {
        networkService.getNews { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let news):
                    self.viewModels = news.compactMap({
                        CustomTableViewCellModel(
                            title: $0.title,
                            subtitle: $0.description ?? "No description",
                            imageURL: URL(string: $0.urlToImage ?? "")
                        )
                    })
                    DispatchQueue.main.async {
                        self.view?.succes()
                    }
                case .failure(let error):
                    self.view.failure(error: error)
                }
            }
        }
    }
}
