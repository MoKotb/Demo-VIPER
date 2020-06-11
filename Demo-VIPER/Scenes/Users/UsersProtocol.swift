//
//  UsersProtocol.swift
//  Demo-VIPER
//
//  Created by Vodafone Egypt on 6/10/20.
//  Copyright © 2020 Mohamed Kotb. All rights reserved.
//
import UIKit

protocol UsersViewProtocol: AnyObject {
    var presenter:UsersPresenterProtocol! { get set }
    func showLoadingInticator()
    func hideLoadingInticator()
    func reloadData()
}

protocol UsersPresenterProtocol: AnyObject {
    var view: UsersViewProtocol? { get set }
    var numberOfUsers:Int { get }
    func viewDidLoad()
    func configureCell(cell:UsersCellViewProtocol,index:Int)
    func userSelected(index:Int)
}

protocol UsersInteractorInputProtocol {
    var presenter: UsersInteractorOutputProtocol? { get set }
    func getUsers()
}

protocol UsersInteractorOutputProtocol: AnyObject {
    func usersFetchedSuccessfully(users:[User])
    func usersFetchingFailed(withError error: Error)
}

protocol UsersCellViewProtocol {
    func userNameData(username:String)
    func userEmailData(email:String)
    func userAddressData(address:String)
}

protocol UsersRouterProtocol {
    static func createModule() -> UIViewController
    func navigateToUserDetails(with email:String)
}
