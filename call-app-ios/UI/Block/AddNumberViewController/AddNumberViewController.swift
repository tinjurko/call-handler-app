//
//  AddNumberViewController.swift
//  call-app-ios
//
//  Created by Tin Jurković on 02/11/2020.
//

import UIKit

class AddNumberViewController: BaseViewController {
    var viewModel: AddNumberViewModel!
    
    @IBOutlet private var containerView: UIView!
    @IBOutlet private var numberTextField: UITextField!
    @IBOutlet private var btnCancel: UIButton!
    @IBOutlet private var btnAdd: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureGestureRecognizer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.numberTextField.becomeFirstResponder()
    }
    
    func configureGestureRecognizer() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissViewController)))
    }
    
    func configureLayout() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        containerView.layer.cornerRadius = 10
        
        numberTextField.font = Font.semiBold.size(16)
        numberTextField.textColor = .neutralDark
        numberTextField.keyboardType = .phonePad
        
        btnCancel.setStyle(.border, color: .gateRed, title: "Cancel", titleColor: .gateRed)
        btnAdd.setStyle(.filled, color: .dodgerBlue, title: "Add", titleColor: .white)
    }
    
    @IBAction func touchUpInside(_ sender: Any) {
        let sender = sender as! UIButton
        
        switch sender {
        case btnCancel:
            dismissViewController()
        case btnAdd:
            if let numberString = numberTextField.text, !numberString.isEmpty, numberString.hasNumber {
                if numberString.count <= 2 {
                    self.showAlert(message: "Number must have more than 2 digits!")
                    return
                }
                
                if numberString.count > 15 {
                    self.showAlert(message: "Number can't have more than 15 digits!")
                    return
                }
                
                viewModel.addNumberToBlockList(numberString: numberString)
                dismissViewController()
                return
            }
            
            self.showAlert(message: "You need to enter the number!")
        default:
            break
        }
    }
    
    @objc private func dismissViewController() {
        self.dismiss(animated: true, completion: nil)
    }

}
