//
//  UserDetailsRouter.swift
//  Demo-VIPER
//
//  Created by Vodafone Egypt on 6/11/20.
//  Copyright © 2020 Mohamed Kotb. All rights reserved.
//
import UIKit

class UserDetailsRouter: UserDetailsRouterProtocol {
    
    weak var viewController: UserDetailsVC?
    
    static func createUserDetailsModule(with email:String) -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(UserDetailsVC.self)") as! UserDetailsVC
        let interactor = UserDetailsInteractor()
        let router = UserDetailsRouter()
        let presenter = UserDetailsPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.email = email
        router.viewController = view
        return view
    }
    
    func navigateBackToUsers() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func showAlert(email:String) {
        let alert = UIAlertController(title: "Welcome on board 😍", message: email, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        viewController?.present(alert, animated: true, completion: nil)
    }
}
