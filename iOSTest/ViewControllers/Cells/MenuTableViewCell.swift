//
//  MenuTableViewCell.swift
//  iOSTest
//
//  Created by Fer on 02/05/22.
//

import UIKit
import SimpleCheckbox

class MenuTableViewCell: UITableViewCell {
    
    lazy var labelText : UILabel = {
       let label = UILabel()
        label.textColor = .black
        return label
    }()
    
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
    
    let defaults = UserDefaults.standard
    var item = ""

    init(tipoCel : String){
        super.init(style: .default, reuseIdentifier: nil)
        initUI()
        item = tipoCel
    }
    
    func initUI(){
        contentView.addSubview(labelText)
        labelText.addAnchors(left: 5, top: 5, right: nil, bottom: nil)
        
        contentView.addSubview(checkBox)
        checkBox.addAnchorsAndSize(width: 25, height: 25, left: nil, top: 7, right: 30, bottom: nil)
        checkBox.addTarget(self, action: #selector(addCheck), for: .valueChanged)
    }
    
    func getArray()->[String]{
        let miArray = (defaults.array(forKey: "miArray") ?? []) as! [String]
        return miArray
    }
    
    @objc func addCheck(sender: Checkbox){
        if checkBox.isChecked == true{
            var newArray = getArray()
            if !newArray.contains(item){
                newArray.append(item)
                defaults.setValue(newArray, forKey: "miArray")
            }
            print("Nuevo item \(item)")
            print(newArray)
            
        }else if checkBox.isChecked == false{
            var newArray = getArray()
            if newArray.contains(item){
                if let index = newArray.firstIndex(of: item){
                    newArray.remove(at: index)
                    defaults.setValue(newArray, forKey: "miArray")
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
