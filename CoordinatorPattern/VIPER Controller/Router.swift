//
//  Router.swift
//  CoordinatorPattern
//
//  Created by Татьяна Мальчик on 17.07.2022.
//

import UIKit

protocol CreateAccountRouterInput {
    func openAuthScreen(withLogin login: String)
}

class CreateAccountRouter: CreateAccountRouterInput {
    weak var rootViewController: UIViewController?
    
    func openAuthScreen(withLogin login: String) {
        let newVC = UIViewController(nibName: nil, bundle: nil)
        newVC.view.backgroundColor = .systemGreen
        rootViewController?.present(newVC, animated: true)
    }
}
