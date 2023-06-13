//
//  DetailPresenter.swift
//  NewsMagazine
//
//  Created by Даниил Попов on 12.06.2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setDescription(viewModule: CustomTableViewCellModel)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, viewModule: CustomTableViewCellModel)
    func setDescription()
}

class DetailPresenter: DetailViewPresenterProtocol {

    
    weak var view: DetailViewProtocol?
    var networkService: NetworkServiceProtocol!
    var viewModule: CustomTableViewCellModel
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, viewModule: CustomTableViewCellModel) {
        self.view = view
        self.networkService = networkService
        self.viewModule = viewModule
    }
    
    func setDescription() {
        self.view?.setDescription(viewModule: viewModule)
    }
}
