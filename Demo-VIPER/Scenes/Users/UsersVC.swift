//
//  UsersVC.swift
//  Demo-VIPER
//
//  Created by Vodafone Egypt on 6/10/20.
//  Copyright © 2020 Mohamed Kotb. All rights reserved.
//
import UIKit
import IHProgressHUD

class UsersVC: UIViewController {

    @IBOutlet weak var usersTableView: UITableView!
    
    var presenter: UsersPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        setupTableView()
        presenter.viewDidLoad()
    }
}

extension UsersVC: UITableViewDataSource , UITableViewDelegate {
    
    private func setupTableView() {
        usersTableView.dataSource = self
        usersTableView.delegate = self
        usersTableView.register(UINib(nibName: "\(UsersCell.self)", bundle: nil), forCellReuseIdentifier: "\(UsersCell.self)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfUsers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "\(UsersCell.self)", for: indexPath) as? UsersCell {
            presenter.configureCell(cell: cell, index: indexPath.row)
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.userSelected(index: indexPath.row)
    }
}

extension UsersVC: UsersViewProtocol {
    
    func showLoadingInticator() {
        IHProgressHUD.show()
    }
    
    func hideLoadingInticator() {
        IHProgressHUD.dismiss()
    }
    
    func reloadData() {
        usersTableView.reloadData()
    }
}
