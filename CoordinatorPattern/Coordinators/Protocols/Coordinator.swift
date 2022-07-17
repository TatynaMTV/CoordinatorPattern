//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by Татьяна Мальчик on 15.07.2022.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    
    func performTransition(with type: Transitions)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
