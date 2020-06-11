//
//  UsersRouter.swift
//  Demo-VIPER
//
//  Created by Vodafone Egypt on 6/10/20.
//  Copyright © 2020 Mohamed Kotb. All rights reserved.
//
import UIKit

class UsersRouter: UsersRouterProtocol {
    
    weak var viewController: UsersVC?
    
    static func createModule() -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(UsersVC.self)") as! UsersVC
        let interactor = UsersInteractor()
        let router = UsersRouter()
        let presenter = UsersPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func navigateToUserDetails(with email: String) {
        let userDetailsVC = UserDetailsRouter.createUserDetailsModule(with: email)
        viewController?.navigationController?.pushViewController(userDetailsVC, animated: true)
    }
}
