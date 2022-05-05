//
//  ImagenTableViewCell.swift
//  iOSTest
//
//  Created by Fer on 04/05/22.
//

import UIKit
import SDWebImage


class ImagenTableViewCell: UITableViewCell {
    
    lazy var myImage : UIImageView = {
       let img = UIImageView()
        img.backgroundColor = .red
        return img
    }()

    init(){
        super.init(style: .default, reuseIdentifier: nil)
        initUI()
    }
    
    func initUI(){
        
        myImage.sd_setImage(with: URL(string: "https://http2.mlstatic.com/vegeta-tamano-real-para-armar-en-papercraft-D_NQ_NP_892880-MLA26232224460_102017-F.jpg"), placeholderImage: UIImage(named: "placeholder.png"))
        contentView.addSubview(myImage)
        myImage.addAnchorsAndCenter(centerX: true, centerY: true, width: 100, height: 100, left: nil, top: 10, right: nil, bottom: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
