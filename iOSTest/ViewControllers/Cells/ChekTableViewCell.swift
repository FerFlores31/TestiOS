//
//  ChekTableViewCell.swift
//  iOSTest
//
//  Created by Fer on 05/05/22.
//

import UIKit
import SimpleCheckbox

class ChekTableViewCell: UITableViewCell {

    
    lazy var checkBox : Checkbox = {
       let chek = Checkbox()
        chek.uncheckedBorderColor = .black
        chek.checkedBorderColor = . black
        chek.borderStyle = .circle
        chek.checkmarkColor = .black
        chek.checkmarkStyle = .tick
        chek.useHapticFeedback = true
        return chek
    }()
    
    var item = ""
    let defaults = UserDefaults.standard
    

    init(tipoCel : String){
        super.init(style: .default, reuseIdentifier: nil)
      
        initUI()
        item = tipoCel

    }
    
    func initUI(){
        
        checkBox.addTarget(self, action: #selector(validateChek), for: .valueChanged)
         contentView.addSubview(checkBox)
        checkBox.addAnchorsAndSize(width: 25, height: 25, left: nil, top: 7, right: 30, bottom: nil)
        
    }
    
    func getArray2()->[String]{
        let letMyArray = (defaults.array(forKey: "myArray2") ?? []) as! [String]
        return letMyArray
        
    }

    @objc func validateChek(sender: Checkbox){
        
        if checkBox.isChecked == true{
            var newArray = getArray2()
            if !newArray.contains(item){
                newArray.append(item)
                defaults.setValue(newArray, forKey: "myArray2")
            }
            print("Nuevo item \(item)")
            print(newArray)
            
        }else if checkBox.isChecked == false{
            var newArray = getArray2()
            if newArray.contains(item){
                if let index = newArray.firstIndex(of: item){
                    newArray.remove(at: index)
                    defaults.setValue(newArray, forKey: "myArray2")
            }
        }
        print("Se elimino \(item)")
            print(newArray)
    }
     
   
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
    
