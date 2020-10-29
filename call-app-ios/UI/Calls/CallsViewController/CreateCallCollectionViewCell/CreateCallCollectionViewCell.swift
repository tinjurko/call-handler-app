//
//  CreateCallCollectionViewCell.swift
//  call-app-ios
//
//  Created by Tin Jurković on 01/11/2020.
//

import UIKit

class CreateCallCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet private var createLabel: UILabel!
    
    var onCellTap: EmptyCallback?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureLayout()
        configureTapGestureRecognizer()
    }
    
    private func configureLayout() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.13)
        self.layer.cornerRadius = 12
        
        createLabel.font = Font.semiBold.size(16)
        createLabel.textColor = .grey1
    }
    
    private func configureTapGestureRecognizer() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cellTap)))
    }
    
    @objc private func cellTap() {
        onCellTap?()
    }
}
