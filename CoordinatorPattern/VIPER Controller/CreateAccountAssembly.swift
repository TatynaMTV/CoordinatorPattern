//
//  CreateAccountAssembly.swift
//  CoordinatorPattern
//
//  Created by Татьяна Мальчик on 18.07.2022.
//

import UIKit

class CreateAccountAssembly {
    static func assemblyCreateAccountModule() -> UIViewController {
        let view = AccountViewController()
        let interactor = CreateAccountInteractor()
        let router = CreateAccountRouter()
        
        let presenter = CreateAccountPresenter(view: view, interactor: interactor, router: router)
        interactor.output = presenter
        view.output = presenter
        
        router.rootViewController = view
        return view
    }
}
