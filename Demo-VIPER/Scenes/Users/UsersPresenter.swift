//
//  UsersPresenter.swift
//  Demo-VIPER
//
//  Created by Vodafone Egypt on 6/10/20.
//  Copyright © 2020 Mohamed Kotb. All rights reserved.
//
import Foundation

class UsersPresenter: UsersPresenterProtocol , UsersInteractorOutputProtocol {

    weak var view: UsersViewProtocol?
    private let interactor:UsersInteractorInputProtocol!
    private let router:UsersRouterProtocol!
    private var users = [User]()
    
    init(view:UsersViewProtocol,interactor:UsersInteractorInputProtocol,router:UsersRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
        
    func viewDidLoad() {
        view?.showLoadingInticator()
        interactor.getUsers()
    }
    
    func configureCell(cell: UsersCellViewProtocol, index: Int) {
        let user = users[index]
        let address = (user.address.street ?? "") + " " + (user.address.suite ?? "")
        cell.userAddressData(address: address)
        cell.userEmailData(email: user.email)
        cell.userNameData(username: user.username)
    }
    
    func userSelected(index: Int) {
        let user = users[index]
        router.navigateToUserDetails(with: user.email)
    }
    
    func usersFetchedSuccessfully(users: [User]) {
        view?.hideLoadingInticator()
        self.users = users
        view?.reloadData()
    }
    
    func usersFetchingFailed(withError error: Error) {
        view?.hideLoadingInticator()
    }
    
    var numberOfUsers: Int {
        return self.users.count
    }
}
