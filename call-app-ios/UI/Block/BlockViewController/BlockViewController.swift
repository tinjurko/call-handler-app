//
//  BlockViewController.swift
//
//  Created by Tin Jurković on 31/10/2020.
//  Copyright © 2020 Tin Jurković. All rights reserved.
//

import UIKit

class BlockViewController: BaseViewController {
    var viewModel: BlockViewModel!

    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnAdd: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        configureCallbacks()
        configureTableView()
    }
    
    func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        navigationTitleLabel.font = Font.bold.size(25)
        navigationTitleLabel.textColor = .neutralDark
        
        btnAdd.tintColor = .neutralDark
    }
    
    func configureCallbacks() {
        viewModel.onReloadData = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(cellClass: NumberTableViewCell.self)
    }
    
    @IBAction func btnAddTouchUpInside(_ sender: Any) {
        viewModel.goToAddBlockedNumber()
    }
    
}

extension BlockViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numbersCount = viewModel.getPhoneNumbersCount()
        
        if numbersCount == 0 {
            tableView.setMessage(message: "No numbers yet!")
            return 0
        }
        
        tableView.removeMessage()
        return numbersCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(for: NumberTableViewCell.self, indexPath: indexPath) else {
            return UITableViewCell()
        }
        
        cell.phoneNumberString = viewModel.getPhoneNumber(index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.remove(index: indexPath.row)
        }
    }
}
