//
//  ColorTableViewCell.swift
//  iOSTest
//
//  Created by Fer on 04/05/22.
//

import UIKit


class ColorTableViewCell: UITableViewCell {

     lazy  var viewTable : UITableView = {
          let table = UITableView()
          table.delegate = self
          table.dataSource = self
          table.backgroundColor = .white
          table.tableFooterView = UIView()
          table.separatorStyle = .none
          return table
      }()
     
     var colorArray = ["Rojo","Verde","Azul","Amarillo","Negro"]
    
     let defaults = UserDefaults.standard

     init(){
         super.init(style: .default, reuseIdentifier: nil)
       
         initUI()
     }
     
     func initUI(){

         contentView.addSubview(viewTable )
         viewTable .addAnchors(left: 0, top: 0 , right: 0, bottom: 0)

     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

 }

 extension ColorTableViewCell : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colorArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let dat = colorArray[indexPath.row]
        let cell = ChekTableViewCell(tipoCel: dat)
        cell.textLabel?.text = dat
        return cell
    }
 }
