//
//  ModuleBuilder.swift
//  NewsMagazine
//
//  Created by Даниил Попов on 10.06.2023.
//

import UIKit

protocol BuilderProtocol {
    
    static func createMainModule() -> UIViewController
    static func createDetailModule(viewModule: CustomTableViewCellModel) -> UIViewController
}

class ModuleBuilder: BuilderProtocol {
    
    static func createAuthModule() -> UIViewController {
        let view = AuthViewController()
        
        return view
        
    }
    
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createDetailModule(viewModule: CustomTableViewCellModel) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, viewModule: viewModule)
        view.presenter = presenter
        return view
    }
    
}
