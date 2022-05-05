//
//  FilterViewController.swift
//  iOSTest
//
//  Created by Fer on 04/05/22.
//

import UIKit

class FilterViewController: UIViewController {
    
    lazy  var viewTable : UITableView = {
         let table = UITableView()
         table.delegate = self
         table.dataSource = self
         table.backgroundColor = .white
         table.tableFooterView = UIView()
         return table
     }()
    
    let defaults = UserDefaults.standard
    var myImage = UIImage(named: "selfie")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
    
    }
    
    func initUI(){
        view.addSubview(viewTable)
        viewTable.addAnchors(left: 0, top: 0, right: 0, bottom: 0)
        
    }
    
    func getArray()->[String]{
        let miArray = (defaults.array(forKey: "miArray") ?? []) as! [String]
        return miArray
    }
}
extension FilterViewController : UITableViewDelegate, UITableViewDataSource{
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 1
}
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return getArray().count
    
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = getArray()[section]
        return title
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let newArray = getArray()[indexPath.section]

            switch newArray {
            case "Camara":
                return 120
            case "Foto":
                return 110
            case "Nombre Completo":
                return 50
            case "Numero Telefonico":
                return 50
            case "Fecha Nacimiento":
                return 50
            case "Sexo":
                return 120
            case "Color Favorito":
                return 280
            default:
                return 100
        }
    }
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let newArray = getArray()[indexPath.section]

        switch newArray {
        case "Camara":
            let cell = CamaraTableViewCell()
            cell.imgView.image = myImage
            return cell
        case "Foto":
            let cell = ImagenTableViewCell()
            return cell
        case "Nombre Completo":
            let cell = NombreTableViewCell()
            return cell
        case "Numero Telefonico":
            let cell = NumeroTableViewCell()
            return cell
        case "Fecha Nacimiento":
            let cell = FechaTableViewCell()
            return cell
        case "Sexo":
            let cell = SexoTableViewCell()
            return cell
        case "Color Favorito":
            let cell = ColorTableViewCell()
            return cell
        default:
            let cell = UITableViewCell()
            return cell
         
    }
    
     
}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let array = getArray()[indexPath.section]
        if array == "Camara"{
                let imagePickerC = UIImagePickerController()
                imagePickerC.delegate = self
                imagePickerC.sourceType = UIImagePickerController.SourceType.camera
                self.present(imagePickerC, animated: true, completion: nil)
            }
            
        }
        }
    
extension FilterViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        myImage = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        self.viewTable.reloadData()
           picker.dismiss(animated: true, completion: nil)
       }
       
       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           picker.dismiss(animated: true, completion: nil)
       }
            
      
}
