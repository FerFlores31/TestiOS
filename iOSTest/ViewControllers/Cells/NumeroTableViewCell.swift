//
//  NumeroTableViewCell.swift
//  iOSTest
//
//  Created by Fer on 04/05/22.
//

import UIKit

class NumeroTableViewCell: UITableViewCell,UITextFieldDelegate {

    lazy var numberTextField : UITextField = {
       let textField = UITextField()
        textField.placeholder = "Ingresa tu numero"
        textField.textAlignment = .center
        textField.textColor = .black
        textField.delegate = self
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.keyboardType = .decimalPad
        return textField
    }()

    init(){
        super.init(style: .default, reuseIdentifier: nil)
      
        initUI()
    }
    
    func initUI(){
        
        contentView.addSubview(numberTextField)
        numberTextField.addAnchorsAndSize(width: nil , height: 30, left: 50, top: 10, right: 50, bottom: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else{
            return false
        }
        let updateText = currentText.replacingCharacters(in: stringRange, with: string)
        return updateText.count <= 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
