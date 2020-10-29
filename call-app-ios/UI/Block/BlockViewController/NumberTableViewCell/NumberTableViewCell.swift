//
//  NumberTableViewCell.swift
//  call-app-ios
//
//  Created by Tin Jurković on 02/11/2020.
//

import UIKit

class NumberTableViewCell: UITableViewCell {

    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var separatorView: UIView!
    
    var phoneNumberString: String! {
        didSet {
            if let phoneNumberString = phoneNumberString {
                phoneNumberLabel.text = phoneNumberString
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureLayout()
    }

    func configureLayout() {
        phoneNumberLabel.font = Font.regular.size(17)
        phoneNumberLabel.textColor = .neutralDark
        
        separatorView.backgroundColor = .grey3
    }

}
