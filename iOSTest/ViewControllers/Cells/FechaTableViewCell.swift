//
//  FechaTableViewCell.swift
//  iOSTest
//
//  Created by Fer on 04/05/22.
//

import UIKit

class FechaTableViewCell: UITableViewCell, UITextFieldDelegate  {
    
    var dateTextField : UITextField = {
        var textField = UITextField()
        textField.placeholder = "Fecha de Nacimiento"
        textField.textAlignment = .center
        textField.textColor = .black
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        return textField
    }()
    
    var datePicker : UIDatePicker?
    var toolBar : UIToolbar?

    init(){
        super.init(style: .default, reuseIdentifier: nil)
      
        initUI()
        dateTextField.delegate = self
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.createDate()
    }
    
    func createDate(){
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.preferredDatePickerStyle = .wheels
        datePicker?.frame.size = CGSize(width: 0, height: 200)
        dateTextField.inputView = datePicker
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        let cancelBtn = UIBarButtonItem(title: "CANCEL", style: .plain, target: self, action: #selector(self.cancelPres))
        let doneBtn = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(self.okPres))
        let flexiBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([cancelBtn, doneBtn, flexiBtn], animated: true)
        dateTextField.inputAccessoryView = toolbar
        
    }
    func initUI(){
        
        contentView.addSubview(dateTextField)
        dateTextField.addAnchorsAndSize(width: nil, height: 30, left: 50, top: 10, right: 50, bottom: nil)
    }
    
    @objc func cancelPres(){
        dateTextField.resignFirstResponder()
    }
    
    @objc func okPres(){
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd-MM-yyyy"
        dateTextField.text = dateFormat.string(from: datePicker!.date)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
