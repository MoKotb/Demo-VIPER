//
//  UsersInteractor.swift
//  Demo-VIPER
//
//  Created by Vodafone Egypt on 6/10/20.
//  Copyright © 2020 Mohamed Kotb. All rights reserved.
//
import Foundation

class UsersInteractor: UsersInteractorInputProtocol {
    
    weak var presenter: UsersInteractorOutputProtocol?
    private let worker: UsersWorker = UsersWorker()
    
    func getUsers() {
        worker.getUsers { [weak self] (result) in
            guard let self = self else { return }
            switch result{
            case .success(let users):
                self.presenter?.usersFetchedSuccessfully(users: users)
            case.failure(let error):
                self.presenter?.usersFetchingFailed(withError: error)
            }
        }
    }
}
