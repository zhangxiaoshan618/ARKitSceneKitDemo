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
        let image = UIImageView(image: UIImage(named: "rectangle")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var bottomBackgroundView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "triangle")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))
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
        tintColor = UIColor.white
        
        func setUpUI() {
            
            addSubview(backgroundView)
            addSubview(bottomBackgroundView)
            addSubview(nameLabel)
            addSubview(distanceLabel)
            
            let backgroundViewConstraintTop = backgroundView.topAnchor.constraint(equalTo: self.topAnchor)
            let backgroundViewConstraintLeading = backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
            let backgroundViewConstraintTrailing = backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            let backgroundViewConstraintBottom = backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
            
            let bottomBackgroundViewConstraintBottom = bottomBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            let bottomBackgroundViewConstraintHeight = bottomBackgroundView.heightAnchor.constraint(equalToConstant: 30)
            let bottomBackgroundViewConstraintWidth = bottomBackgroundView.widthAnchor.constraint(equalToConstant: 20)
            let bottomBackgroundViewConstraintCentX = bottomBackgroundView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
            let nameLabelConstraintTop = nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
            let nameLabelConstraintLeading = nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
            let nameLabelConstraintTrailing = nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
            let nameLabelConstraintHeight = nameLabel.heightAnchor.constraint(equalToConstant: 20)
            
            let distanceLabelConstraintTop = distanceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5)
            let distanceLabellConstraintLeading = distanceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
            let distanceLabelConstraintTrailing = distanceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
            let distanceLabelConstraintHeight = distanceLabel.heightAnchor.constraint(equalToConstant: 15)
            
            NSLayoutConstraint.activate([backgroundViewConstraintTop, backgroundViewConstraintLeading, backgroundViewConstraintTrailing, backgroundViewConstraintBottom, bottomBackgroundViewConstraintBottom, bottomBackgroundViewConstraintCentX, bottomBackgroundViewConstraintWidth, bottomBackgroundViewConstraintHeight, nameLabelConstraintTop, nameLabelConstraintLeading, nameLabelConstraintTrailing, nameLabelConstraintHeight, distanceLabelConstraintTop, distanceLabelConstraintTrailing, distanceLabellConstraintLeading, distanceLabelConstraintHeight])
        }
        
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeImage() -> UIImage? {
        UIGraphicsBeginImageContext(self.bounds.size)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image;
    }

}
