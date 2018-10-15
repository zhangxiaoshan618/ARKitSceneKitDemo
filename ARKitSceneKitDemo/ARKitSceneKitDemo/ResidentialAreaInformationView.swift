//
//  ResidentialAreaInformationView.swift
//  ARKitSpriteKitDemo
//
//  Created by 张晓珊 on 2018/10/11.
//  Copyright © 2018年 张晓珊. All rights reserved.
//

import UIKit


class ResidentialAreaInformationView: UIView {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var distanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var longitudeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var latitude: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.init(white: 0, alpha: 0.8)
        
        func setUpUI() {
            addSubview(nameLabel)
            addSubview(distanceLabel)
            addSubview(addressLabel)
            addSubview(longitudeLabel)
            addSubview(latitude)
            
            let views = ["nameLabel" : nameLabel, "distanceLabel" : distanceLabel, "addressLabel" : addressLabel, "longitudeLabel" : longitudeLabel, "latitude" : latitude]
            
            let nameConstraintH = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[nameLabel]-10-|", options: [], metrics: nil, views: views)
            let addressConstraintH = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[addressLabel]-10-|", options: [], metrics: nil, views: views)
            let distanceLongitudeLatitudeConstraintH = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[distanceLabel]-5-[longitudeLabel(==distanceLabel)]-5-[latitude(==distanceLabel)]-10-|", options: [], metrics: nil, views: views)
            let constraintV = NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[nameLabel(17)]-5-[addressLabel(<=36)]-5-[distanceLabel(17)]-10-|", options: [], metrics: nil, views: views)
            let longitudeConstraintV = NSLayoutConstraint.constraints(withVisualFormat: "V:[longitudeLabel(17)]-10-|", options: [], metrics: nil, views: views)
            let latitudeConstraintV = NSLayoutConstraint.constraints(withVisualFormat: "V:[latitude(17)]-10-|", options: [], metrics: nil, views: views)
            
            NSLayoutConstraint.activate(nameConstraintH + addressConstraintH + distanceLongitudeLatitudeConstraintH + constraintV + longitudeConstraintV + latitudeConstraintV)
        }
        
        setUpUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configWith(name: String, address: String, distance: String, longitude: Double, latitude: Double) {
        self.nameLabel.text = "名称：" + name
        self.addressLabel.text = "地址：" + address
        self.distanceLabel.text = "距离：" + distance
        self.longitudeLabel.text = "经度" + String(format: "%.2f", longitude)
        self.latitude.text = "纬度" + String(format: "%.2f", latitude)
    }
    
}
