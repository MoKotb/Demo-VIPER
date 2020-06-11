//
//  User.swift
//  Demo-VIPER
//
//  Created by Vodafone Egypt on 6/10/20.
//  Copyright © 2020 Mohamed Kotb. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: Int?
    var name: String
    var username: String
    var email: String
    var phone: String
    var address: Address
}
