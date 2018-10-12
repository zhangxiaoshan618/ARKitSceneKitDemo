//
//  ResidentialAreaInformationView.swift
//  ARKitSpriteKitDemo
//
//  Created by 张晓珊 on 2018/10/11.
//  Copyright © 2018年 张晓珊. All rights reserved.
//

import UIKit

class ResidentialAreaInformationView: UIView {

    lazy var backgroundView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "map_bubble")?.stretchableImage(withLeftCapWidth: 20, topCapHeight: 20))
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "融泽嘉园2期2号院"
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUI() {
        
        self.addSubview(backgroundView)
        self.addSubview(nameLabel)
        
        let views = ["backgroundView" : backgroundView, "nameLabel" : nameLabel]

        let backgroundViewConstrantH = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[backgroundView]-0-|", options: [], metrics: nil, views: views)
        let backgroundViewConstrantV = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[backgroundView]-0-|", options: [], metrics: nil, views: views)
        let nameLabelConstrantH = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[nameLabel]-10-|", options: [], metrics: nil, views: views)
        let nameLabelConstrantV = NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[nameLabel]-20-|", options: [], metrics: nil, views: views)

        NSLayoutConstraint.activate(backgroundViewConstrantH + backgroundViewConstrantV + nameLabelConstrantH + nameLabelConstrantV)
    }
    

}
