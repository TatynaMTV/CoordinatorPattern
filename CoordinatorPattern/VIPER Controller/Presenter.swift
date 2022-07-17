//
//  Presenter.swift
//  CoordinatorPattern
//
//  Created by Татьяна Мальчик on 17.07.2022.
//

import Foundation

protocol CreateAccountPresenterInput {
    var output: CreateAccountPresenterOutput? { get set }
}

protocol CreateAccountPresenterOutput: AnyObject {
    
}

class CreateAccountPresenter: CreateAccountPresenterInput {
    var output: CreateAccountPresenterOutput?
    
    private let interactor: CreateAccountInteractorInput
    private let router: CreateAccountRouterInput
    private let view: CreateAccountViewInput
    
    init(view: CreateAccountViewInput,
         interactor: CreateAccountInteractorInput,
         router: CreateAccountRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension CreateAccountPresenter: CreateAccountViewOutput {
    func userSelectCreateAccount(withLogin login: String, password: String) {
        interactor.createAccount(withLogin: login, password: password)
    }
}

extension CreateAccountPresenter: CreateAccountInteractorOutput {
    func didReseive(error: String) {
        
    }
    
    func didCreateAccount(withLogin login: String) {
        router.openAuthScreen(withLogin: login)
    }
    
    
}
