//
//  ResidentialAreaInformationNode.swift
//  ARKitSceneKitDemo
//
//  Created by 张晓珊 on 2018/10/12.
//  Copyright © 2018年 张晓珊. All rights reserved.
//

import ARKit
import MapKit

class ResidentialAreaInformationViewModel: NSObject {
    var cardModel: ResidentialAreaCardModel
    var position: SCNVector3
    
    var name: String = ""
    var address: String = ""
    var distance: String = ""
    var latitude: CLLocationDegrees = 0
    var longitude: CLLocationDegrees = 0
    
    override var description: String {
        return name + "/\(position)/\(latitude)/\(longitude)"
    }
    
    
    init(with model: ResidentialAreaInfomationModel) {
        
        func autoAdjustPosition(with originalValue: Double) -> Double {
            if originalValue < 50 {
                return 40 + (originalValue / 50) * 10
            }else {
                return originalValue
            }
        }
        
        let cardModel = ResidentialAreaCardModel()
        cardModel.distance = model.distance
        cardModel.name = model.name
        
        let width: CGFloat = ceil((model.name as NSString).boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 23), options: [], attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)], context: nil).width)
        
        cardModel.size = CGSize(width: (width > 200 ? 200 : width) + 20, height: 80)
        self.cardModel = cardModel
        
        let location = CLLocation(latitude: 40.0467683620, longitude: 116.3146165990)
        let residentialAreaLocation = CLLocation(latitude: model.latitude, longitude: model.longitude)
        
        let guidePosition = CLLocation(latitude: 40.0467683620, longitude: model.longitude)
        var vector3X = guidePosition.distance(from: residentialAreaLocation)
        vector3X = autoAdjustPosition(with: vector3X)
        
        var vector3Z = guidePosition.distance(from: location)
        vector3Z = autoAdjustPosition(with: vector3Z)
        
        if residentialAreaLocation.coordinate.longitude < location.coordinate.longitude {
            vector3X = -vector3X
        }
        
        if residentialAreaLocation.coordinate.latitude > location.coordinate.latitude {
            vector3Z = -vector3Z
        }
        
        self.position = SCNVector3Make(Float(vector3X), 10, Float(vector3Z))
        
        self.name = model.name
        self.address = model.description
        self.distance = model.distance
        self.latitude = model.latitude
        self.longitude = model.longitude
    }
    
}

class ResidentialAreaInformationNode: SCNNode {
    
    var model: ResidentialAreaInformationViewModel
    var isSelected: Bool = false {
        didSet {
            self.cardView.tintColor = isSelected ? UIColor.green : UIColor.white
            plane.firstMaterial?.diffuse.contents = cardView.makeImage()
        }
    }

    lazy var cardView: ResidentialAreaCardView = {
        let view = ResidentialAreaCardView(model: self.model.cardModel)
        view.layoutIfNeeded()
        return view
    }()
    
    lazy var plane: SCNPlane = {
        let height: CGFloat = 10
        let width: CGFloat = cardView.bounds.width / cardView.bounds.height * height
        let plane = SCNPlane(width: width, height: height)
        plane.firstMaterial?.diffuse.contents = cardView.makeImage()
        plane.firstMaterial?.lightingModel = .constant
        return plane
    }()

    init(with model: ResidentialAreaInformationViewModel) {
        self.model = model
        super.init()
        self.geometry = plane
        
        let constraint = SCNBillboardConstraint()
        constraint.freeAxes = .Y
        self.constraints = [constraint]
        self.position = model.position
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
