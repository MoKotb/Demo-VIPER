//
//  UsersCell.swift
//  Demo-VIPER
//
//  Created by Vodafone Egypt on 6/10/20.
//  Copyright © 2020 Mohamed Kotb. All rights reserved.
//
import UIKit

class UsersCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}

extension UsersCell: UsersCellViewProtocol {
    
    func userNameData(username: String) {
        userNameLabel.text = username
    }
    
    func userEmailData(email: String) {
        emailLabel.text = email
    }
    
    func userAddressData(address: String) {
        addressLabel.text = address
    }
}
