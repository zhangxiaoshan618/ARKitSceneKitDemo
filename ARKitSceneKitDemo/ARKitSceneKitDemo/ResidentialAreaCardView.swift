//
//  ResidentialAreaCardView.swift
//  ARKitSceneKitDemo
//
//  Created by 张晓珊 on 2018/10/12.
//  Copyright © 2018年 张晓珊. All rights reserved.
//

import UIKit

class ResidentialAreaCardModel {
    var name: String = ""
    var distance: String = ""
    var size: CGSize = CGSize.zero
}

class ResidentialAreaCardView: UIView {

    lazy var backgroundView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "rectangle"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var bottomBackgroundView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "triangle"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    lazy var distanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    convenience init(model: ResidentialAreaCardModel) {
        self.init(frame: CGRect(origin: CGPoint.zero, size: model.size))
        self.nameLabel.text = model.name
        self.distanceLabel.text = model.distance
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        
        func setUpUI() {
            
            addSubview(backgroundView)
            addSubview(bottomBackgroundView)
            addSubview(nameLabel)
            addSubview(distanceLabel)
            
            let views = ["backgroundView" : backgroundView, "bottomBackgroundView" : bottomBackgroundView, "nameLabel" : nameLabel, "distanceLabel" : distanceLabel]
            
            let backgroundViewConstraintH = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[backgroundView]-0-|", options: [], metrics: nil, views: views)
            
            let backgroundViewConstraintHeight = backgroundView.heightAnchor.constraint(equalToConstant: 8)
            let backgroundViewConstraintTop = backgroundView.topAnchor.constraint(equalTo: self.topAnchor)
            let bottomBackgroundViewConstraintBottom = bottomBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            let bottomBackgroundViewConstraintHeight = bottomBackgroundView.heightAnchor.constraint(equalToConstant: 20)
            let bottomBackgroundViewConstraintWidth = bottomBackgroundView.widthAnchor.constraint(equalToConstant: 20)
            let bottomBackgroundViewConstraintCentX = bottomBackgroundView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
            
            let nameLabelConstrantH = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[nameLabel]-10-|", options: [], metrics: nil, views: views)
            let contentConstrantV = NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[nameLabel(13)]-5-[distanceLabel(10)]-20-|", options: [], metrics: nil, views: views)
            let distanceLabelConstrantH = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[distanceLabel]-10-|", options: [], metrics: nil, views: views)
            
            
            NSLayoutConstraint.activate(backgroundViewConstraintH + nameLabelConstrantH + contentConstrantV + distanceLabelConstrantH + [bottomBackgroundViewConstraintWidth, bottomBackgroundViewConstraintCentX, bottomBackgroundViewConstraintHeight, bottomBackgroundViewConstraintBottom, backgroundViewConstraintTop, backgroundViewConstraintHeight])
        }
        
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
