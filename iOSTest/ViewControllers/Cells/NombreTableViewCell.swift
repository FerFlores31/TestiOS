//
//  NombreTableViewCell.swift
//  iOSTest
//
//  Created by Fer on 04/05/22.
//

import UIKit

class NombreTableViewCell: UITableViewCell,UITextFieldDelegate {
    
    lazy var nameTextField : UITextField = {
       let textField = UITextField()
        textField.placeholder = "Ingresa tu Nombre"
        textField.textColor = .black
        textField.textAlignment = .center
        textField.delegate = self
        textField.keyboardType = .asciiCapable
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()


    init(){
        super.init(style: .default, reuseIdentifier: nil)
        initUI()
    }

    func initUI(){
      
        contentView.addSubview(nameTextField)
        nameTextField.addAnchorsAndSize(width: nil, height: 30, left: 50, top: 10, right: 50, bottom: nil)
 
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool

    {
         let currentText = textField.text ?? ""
         guard let stringRange = Range(range, in: currentText) else{
             return false
         }
         let updateText = currentText.replacingCharacters(in: stringRange, with: string)
         let character = NSCharacterSet.init(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ")
                    let stringFromTextField = NSCharacterSet.init(charactersIn: string)
                    let strValid = character.isSuperset(of: stringFromTextField as CharacterSet)
                     return strValid && updateText.count <= 35
     }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
}
