//
//  UsersWorker.swift
//  Demo-VIPER
//
//  Created by Vodafone Egypt on 6/10/20.
//  Copyright © 2020 Mohamed Kotb. All rights reserved.
//
import Foundation

class UsersWorker {
    
    private let networkLayer = NetworkLayer()
    
    func getUsers(completionHandler: @escaping (Result<[User]>) -> ()){
        networkLayer.request(UserRouter.get, decodeToType: [User].self, completionHandler: completionHandler)
    }
}
