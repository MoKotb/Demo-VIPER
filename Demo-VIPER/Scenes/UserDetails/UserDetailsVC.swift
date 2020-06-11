//
//  UserDetailsVC.swift
//  Demo-VIPER
//
//  Created by Vodafone Egypt on 6/11/20.
//  Copyright © 2020 Mohamed Kotb. All rights reserved.
//
import UIKit

class UserDetailsVC: UIViewController {

    @IBOutlet weak var userEmailLabel: UILabel!
    
    var presenter: UserDetailsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    @IBAction func onAlertPressed(_ sender: Any) {
        presenter.alertPressed()
    }
    
    @IBAction func onBackPressed(_ sender: Any) {
        presenter.backPressed()
    }
}

extension UserDetailsVC: UserDetailsViewProtocol {
    
    func displayEmail(email: String) {
        userEmailLabel.text = email
    }
}
