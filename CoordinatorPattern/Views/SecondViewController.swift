//
//  SecondViewController.swift
//  CoordinatorPattern
//
//  Created by Татьяна Мальчик on 17.07.2022.
//

import UIKit

class SecondViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SecondVC"
        view.backgroundColor = .systemGreen
    }
}
