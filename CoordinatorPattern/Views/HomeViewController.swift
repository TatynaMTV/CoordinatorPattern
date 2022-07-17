//
//  ViewController.swift
//  CoordinatorPattern
//
//  Created by Татьяна Мальчик on 15.07.2022.
//

import UIKit

class HomeViewController: UIViewController, Coordinating  {
    var coordinator: Coordinator?
    
    private let firstButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("to secondVC", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let secondButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("to VIPER_VC", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Home"
        
        firstButton.addTarget(self, action: #selector(didTapFirstButton), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(didTapSecondButton), for: .touchUpInside)
        
        setupViews()
    }
    
    @objc func didTapFirstButton() {
        coordinator?.performTransition(with: .push(SecondViewController()))
    }
    
    @objc func didTapSecondButton() {
        coordinator?.performTransition(with: .push(AccountViewController()))
    }
    
    private func setupViews() {
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        
        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            firstButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -16),
            firstButton.heightAnchor.constraint(equalToConstant: 55),
            firstButton.widthAnchor.constraint(equalToConstant: 220),
            
            secondButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 16),
            secondButton.heightAnchor.constraint(equalToConstant: 55),
            secondButton.widthAnchor.constraint(equalToConstant: 220)

        ])
    }
}

