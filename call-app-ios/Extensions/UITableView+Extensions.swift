//
//  UITableView+Extensions.swift
//
//  Created by Tin Jurković.
//  Copyright © 2020 Tin Jurković. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(cellClass: T.Type) {
        self.register(UINib(nibName: String(describing: cellClass), bundle: .main), forCellReuseIdentifier: String(describing: cellClass))
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for cell: T.Type, indexPath: IndexPath) -> T? {
        guard let cell = self.dequeueReusableCell(withIdentifier: String(describing: cell), for: indexPath) as? T else {
            return nil
        }
        
        return cell
    }
    
    func setMessage(message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .grey3
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = Font.semiBold.size(16)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
        self.backgroundView?.backgroundColor = .white
    }
    
    func removeMessage() {
        self.backgroundView = nil
    }
}
