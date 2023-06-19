//
//  LaunchScreenController.swift
//  NewsMagazine
//
//  Created by Даниил Попов on 19.06.2023.
//

import UIKit

class LaunchScreenController: UIViewController {
    
    private var imageView: UIImageView = {
       let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.image = UIImage(named: "icons8-news-64")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgraundColor()
        view.addSubview(imageView)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.animate()
        }
    }
    
    func setupBackgraundColor() {
        if self.traitCollection.userInterfaceStyle == .dark {
            view.backgroundColor = .black
        } else {
            view.backgroundColor = .white
        }
    }
    
    private func animate() {
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 1.5
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(x: -(diffX/2),
                                          y: diffY/2,
                                          width: size,
                                          height: size)
            self.imageView.alpha = 0
        },completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                    let authVC = ModuleBuilder.createAuthModule()
                    authVC.modalTransitionStyle = .crossDissolve
                    authVC.modalPresentationStyle = .fullScreen
                    self.present(authVC, animated: true)
                })
            }
        })
    }
}
