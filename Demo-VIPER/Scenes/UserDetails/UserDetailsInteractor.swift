//
//  UserDetailsInteractor.swift
//  Demo-VIPER
//
//  Created by Vodafone Egypt on 6/11/20.
//  Copyright © 2020 Mohamed Kotb. All rights reserved.
//
import Foundation

class UserDetailsInteractor: UserDetailsInteractorInputProtocol {
    
    weak var presenter: UserDetailsInteractorOutputProtocol?
   
    var email:String = ""
    
    func getUserEmail() {
        if email != "" {
            presenter?.emailFetchedSuccessfully(email: email)
        }else {
            presenter?.emailFetchingFailed(withError: "Not found" as! Error)
        }
    }
}
