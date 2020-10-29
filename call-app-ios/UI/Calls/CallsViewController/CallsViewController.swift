//
//  HomeViewController.swift
//
//  Created by Tin Jurković on 31/10/2020.
//  Copyright © 2020 Tin Jurković. All rights reserved.
//

import UIKit

class CallsViewController: BaseViewController {
    var viewModel: CallsViewModel!
    
    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        configureCollectionView()
        setupCallbacks()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.reloadData()
    }
    
    func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        navigationTitleLabel.font = Font.bold.size(25)
        navigationTitleLabel.textColor = .neutralDark
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(cell: CallCollectionViewCell.self)
        collectionView.register(cell: CreateCallCollectionViewCell.self)
    }
    
    func setupCallbacks() {
        viewModel.onReloadData = { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
    }
}

extension CallsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getCallsCount() + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  48
        let collectionViewSize = collectionView.frame.size.width - padding
        let cellSize = collectionViewSize/2
        
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == viewModel.getCallsCount() { //CREATE CALL CELL
            guard let cell = collectionView.dequeueReusableCell(for: CreateCallCollectionViewCell.self, indexPath: indexPath) else {
                return UICollectionViewCell()
            }
            
            cell.onCellTap = {
                self.viewModel.goToCreateNewCall()
            }

            return cell
        }
        
        //CALL CELL
        guard let cell = collectionView.dequeueReusableCell(for: CallCollectionViewCell.self, indexPath: indexPath) else {
            return UICollectionViewCell()
        }
        
        cell.call = viewModel.getCall(index: indexPath.row)
        
        cell.onCellTap = {
            self.viewModel.setHeld(for: indexPath.row)
        }
        
        cell.onCellLongTap = {
            self.showCustomAlert(title: "Do you want to end a call?", actionTitle: "End") {
                self.viewModel.endCall(for: indexPath.row)
            } 
        }
        
        return cell
    }
}
