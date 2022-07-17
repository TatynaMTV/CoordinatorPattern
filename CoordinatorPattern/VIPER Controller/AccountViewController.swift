//
//  AccountViewController.swift
//  CoordinatorPattern
//
//  Created by Татьяна Мальчик on 17.07.2022.
//

import UIKit

protocol CreateAccountViewInput {
    var output: CreateAccountViewOutput? { get set}
}

protocol CreateAccountViewOutput {
    func userSelectCreateAccount(withLogin login: String, password: String)
}

class AccountViewController: UIViewController, CreateAccountViewInput, Coordinating {
    var coordinator: Coordinator?
    var output: CreateAccountViewOutput?
    
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "login123"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "qwerty123"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let acceptButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        setupViews()
        acceptButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

    }
    
    @objc private func buttonPressed() {
        output?.userSelectCreateAccount(withLogin: loginLabel.text ?? "",
                                        password: passwordLabel.text ?? "")
//        coordinator?.performTransition(with: .dismiss)
    }
    
    private func setupViews() {
        view.addSubview(loginLabel)
        view.addSubview(passwordLabel)
        view.addSubview(acceptButton)
        
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            loginLabel.bottomAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: -16),
            
            passwordLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            passwordLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            acceptButton.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 16),
            acceptButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            acceptButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            acceptButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
