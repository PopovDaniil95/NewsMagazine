//
//  MainPresenter.swift
//  NewsMagazine
//
//  Created by Даниил Попов on 10.06.2023.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getNews()
    var news: News? { get set }
}

class MainPresenter: MainViewPresenterProtocol {
    
    weak var view: MainViewProtocol!
    let networkService: NetworkServiceProtocol!
    var news: News?
    
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
                    self.news = news
                    self.view?.succes()
                case .failure(let error):
                    self.view.failure(error: error)
                }
            }
        }
    }
    
    
    
}
