//
//  AppCoordinator.swift
//  CoordinatorPattern
//
//  Created by Татьяна Мальчик on 15.07.2022.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    func performTransition(with type: Transitions) {
        switch type {
        case .push(let viewController):
            let vc = viewController
            navigationController?.pushViewController(vc, animated: true)
        case .present:
            break
        case .dismiss:
            break
        case .pop:
            break
        case .none:
            break
        }
    }
    func start() {
        let vc = HomeViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
}
