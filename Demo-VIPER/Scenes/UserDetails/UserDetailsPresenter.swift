//
//  UserDetailsPresenter.swift
//  Demo-VIPER
//
//  Created by Vodafone Egypt on 6/11/20.
//  Copyright © 2020 Mohamed Kotb. All rights reserved.
//
import Foundation

class UserDetailsPresenter: UserDetailsPresenterProtocol , UserDetailsInteractorOutputProtocol {
    
    weak var view: UserDetailsViewProtocol?
    private let interactor:UserDetailsInteractorInputProtocol!
    private let router:UserDetailsRouterProtocol!
    var email:String = ""
    
    init(view:UserDetailsViewProtocol,interactor:UserDetailsInteractorInputProtocol,router:UserDetailsRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.getUserEmail()
    }
    
    func alertPressed() {
        router.showAlert(email: self.email)
    }
    
    func backPressed() {
        router.navigateBackToUsers()
    }
    
    func emailFetchedSuccessfully(email: String) {
        self.email = email
        view?.displayEmail(email: email)
    }
    
    func emailFetchingFailed(withError error: Error) {
        print(error.localizedDescription)
    }
}
