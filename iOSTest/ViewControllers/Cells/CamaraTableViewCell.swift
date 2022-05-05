//
//  CamaraTableViewCell.swift
//  iOSTest
//
//  Created by Fer on 04/05/22.
//

import UIKit

class CamaraTableViewCell: UITableViewCell {
    
    lazy var ownContent : UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()

    lazy var imgView : UIImageView = {
       let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()

    init(){
        super.init(style: .default, reuseIdentifier: nil)
      
        initUI()
        
    }
    
    func initUI(){
        
        contentView.addSubview(ownContent)
        ownContent.addAnchorsAndSize(width: 100, height: 100, left: 100, top: 10, right: 100, bottom: nil)
        ownContent.addSubview(imgView)
        imgView.addAnchorsAndSize(width: nil, height: 25, left: 10, top: 10, right: 10, bottom: 10)
    }
 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
