//
//  Inetractor.swift
//  CoordinatorPattern
//
//  Created by Татьяна Мальчик on 17.07.2022.
//

import Foundation

protocol CreateAccountInteractorInput {
    var output: CreateAccountInteractorOutput? { get set }
    func createAccount(withLogin login: String, password: String)
}

protocol CreateAccountInteractorOutput {
    func didReseive(error: String)
    func didCreateAccount(withLogin login: String)
}


class CreateAccountInteractor: CreateAccountInteractorInput {
    var output: CreateAccountInteractorOutput?
    
    func createAccount(withLogin login: String, password: String) {
        let _ = Account(login: login, password: password)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.output?.didCreateAccount(withLogin: login)
        }
    }
    
    
}   
