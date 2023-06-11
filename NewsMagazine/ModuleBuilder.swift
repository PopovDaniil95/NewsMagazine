//
//  ModuleBuilder.swift
//  NewsMagazine
//
//  Created by Даниил Попов on 10.06.2023.
//

import UIKit

protocol BuilderProtocol {
    
    static func createMainModule() -> UIViewController
    
}

class ModuleBuilder: BuilderProtocol {
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    
}
