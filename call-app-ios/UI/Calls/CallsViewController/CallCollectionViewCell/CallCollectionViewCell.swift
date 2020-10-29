//
//  CallCollectionViewCell.swift
//  call-app-ios
//
//  Created by Tin Jurković on 01/11/2020.
//

import UIKit

class CallCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet private var statusLabel: UILabel!
    @IBOutlet private var handleLabel: UILabel!
    
    var onCellTap: EmptyCallback?
    var onCellLongTap: EmptyCallback?
    
    let initialBackgroundColor = UIColor.black.withAlphaComponent(0.13)
    
    var call: Call! {
        didSet {
            callerHandle = call.handle
            callState = call.state
            incoming = !call.outgoing
        }
    }
    
    private var callState: CallState? {
      didSet {
        guard let callState = callState else { return }
        
        switch callState {
        case .active:
            statusLabel.text = "Active"
        case .held:
            statusLabel.text = "On Hold"
        case .connecting:
            statusLabel.text = "Connecting..."
        default:
            statusLabel.text = "Dialing..."
        }
      }
    }
    
    private var incoming: Bool = false {
      didSet {
        iconImageView.image = incoming ? #imageLiteral(resourceName: "call-incoming") : #imageLiteral(resourceName: "call-outgoing")
      }
    }
    
    private var callerHandle: String? {
      didSet {
        handleLabel.text = callerHandle
      }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureLayout()
        configureTapGesture()
        configureLongTapGesture()
    }
    
    private func configureLayout() {
        self.backgroundColor = initialBackgroundColor
        self.layer.cornerRadius = 12
        
        iconImageView.isUserInteractionEnabled = false
        
        statusLabel.font = Font.semiBold.size(17)
        statusLabel.textColor = .neutralDark
        statusLabel.isUserInteractionEnabled = false
        
        handleLabel.font = Font.regular.size(16)
        handleLabel.textColor = .grey1
        handleLabel.isUserInteractionEnabled = false
    }
    
    private func configureTapGesture() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cellTapped)))
    }
    
    @objc private func cellTapped() {
        onCellTap?()
    }
    
    private func configureLongTapGesture() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longCellTap(gestureRecognizer:)))
        longPressGesture.minimumPressDuration = 0.2
        self.addGestureRecognizer(longPressGesture)
    }
    
    @objc private func longCellTap(gestureRecognizer: UIGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began:
            self.backgroundColor = UIColor.black.withAlphaComponent(0.25)
            onCellLongTap?()
        case .cancelled:
            self.backgroundColor = initialBackgroundColor
        case .ended:
            self.backgroundColor = initialBackgroundColor
        default:
            break
        }
    }

}
