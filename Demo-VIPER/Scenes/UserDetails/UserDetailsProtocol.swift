//
//  UserDetailsProtocol.swift
//  Demo-VIPER
//
//  Created by Vodafone Egypt on 6/11/20.
//  Copyright © 2020 Mohamed Kotb. All rights reserved.
//
import UIKit

protocol UserDetailsViewProtocol: AnyObject {
    var presenter: UserDetailsPresenterProtocol! { get set }
    func displayEmail(email:String)
}

protocol UserDetailsPresenterProtocol: AnyObject {
    var view: UserDetailsViewProtocol? { get set }
    func viewDidLoad()
    func alertPressed()
    func backPressed()
}

protocol UserDetailsInteractorInputProtocol {
    var presenter: UserDetailsInteractorOutputProtocol? { get set }
    func getUserEmail()
}

protocol UserDetailsInteractorOutputProtocol: AnyObject {
    func emailFetchedSuccessfully(email:String)
    func emailFetchingFailed(withError error: Error)
}

protocol UserDetailsRouterProtocol {
    static func createUserDetailsModule(with email:String) -> UIViewController
    func navigateBackToUsers()
    func showAlert(email:String)
}
