//
//  ViewController.swift
//  iOSTest
//
//  Created by Fer on 02/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    lazy  var viewTable : UITableView = {
         let table = UITableView()
         table.delegate = self
         table.dataSource = self
         table.backgroundColor = .white
         table.tableFooterView = UIView()
         return table
     }()
    
    lazy var buttonAccess : UIButton = {
       let button = UIButton()
        button.setTitle("Siguiente", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    var dataSource = ["Camara","Foto","Nombre Completo", "Numero Telefonico","Fecha Nacimiento","Sexo", "Color Favorito"]
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Test iOS"
        initUI()
    }
    
    func initUI(){
        
        view.addSubview(viewTable)
        viewTable.addAnchors(left: 0, top: 10, right: 0, bottom: 90)
        view.addSubview(buttonAccess)
        buttonAccess.addAnchorsAndSize(width: nil, height: 50, left: 10, top: 10, right: 10, bottom:nil, withAnchor: .top, relativeToView: viewTable)
        buttonAccess.addTarget(self, action: #selector(accesBtn), for: UIControl.Event.touchUpInside)
    }
    
    func getArray()->[String]{
        let miArray = (defaults.array(forKey: "miArray") ?? []) as! [String]
        return miArray
    }
    
    @objc func accesBtn(){
        let newArray = getArray()
        if newArray.count != 0 {
            let vc = FilterViewController()
            navigationController?.pushViewController(vc, animated: true)
        }else{
            let alert = UIAlertController(title: "Selecciona al menos una opción", message: "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: { (action) in
                
            }))
            self.present(alert, animated: true, completion: nil)
    }

    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dat = dataSource[indexPath.row]
        let cell = MenuTableViewCell(tipoCel: dat)
        cell.labelText.text = dat
        return cell
     
    }
    
}
