//
//  ViewController.swift
//  ARKitSceneKitDemo
//
//  Created by 张晓珊 on 2018/10/11.
//  Copyright © 2018年 张晓珊. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    private var viewModel: ViewModel = ViewModel()
    private var nodes: [ResidentialAreaInformationNode] = []
    private var selectedNode: ResidentialAreaInformationNode?
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.init(white: 0, alpha: 0.8)
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var infoView: ResidentialAreaInformationView = {
        let view = ResidentialAreaInformationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.hidesWhenStopped = true
        return activity
    }()
    
    private lazy var testView: ResidentialAreaCardView = {
        let model = ResidentialAreaCardModel()
        model.name = "融泽嘉园"
        model.distance = "约100米"
        model.size = CGSize(width: 100, height: 80)
        
        let test = ResidentialAreaCardView(model: model)
        
        return test
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 100, width: 200, height: 80))
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func setUpUI() {
            view.addSubview(infoView)
            view.addSubview(activity)
            view.addSubview(testView)
            view.addSubview(image)
            
            let views = ["infoView" : infoView]
            let infoLabelConstraintH = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[infoView]-0-|", options: [], metrics: nil, views: views)
            let infoLabelConstraintV = NSLayoutConstraint.constraints(withVisualFormat: "V:[infoView(100)]-0-|", options: [], metrics: nil, views: views)
            let activetyConstraintCenterY = activity.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            let activetyConstraintCenterX = activity.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
            
            NSLayoutConstraint.activate(infoLabelConstraintH + infoLabelConstraintV + [activetyConstraintCenterX, activetyConstraintCenterY])
        }
        
        func updateNodes() {
            var nodes: [ResidentialAreaInformationNode] = []
            
            for model in viewModel.models {
                let infoViewModel = ResidentialAreaInformationViewModel(with: model)
                let node: ResidentialAreaInformationNode = ResidentialAreaInformationNode(with: infoViewModel)
                sceneView.scene.rootNode.addChildNode(node)
                nodes.append(node)
            }
            self.nodes = nodes
        }
        
        setUpUI()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        let configuration = AROrientationTrackingConfiguration()
        configuration.worldAlignment = .gravityAndHeading
        
        sceneView.session.run(configuration, options: [])
        
//        sceneView.scene.rootNode.addChildNode(node)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap(gestrueRecognize:)))
        
        view.addGestureRecognizer(tapGesture)
        
        
        activity.startAnimating()
        viewModel.loadData {
            updateNodes()
            self.activity.stopAnimating()
        }
    }
    
    @objc
    func handleTap(gestrueRecognize: UITapGestureRecognizer) {

//        let height: CGFloat = 10
//        let width: CGFloat = testView.bounds.width / testView.bounds.height * height
//        let plane = SCNPlane(width: width, height: height)
//        plane.firstMaterial?.diffuse.contents = testView.layer
//        plane.firstMaterial?.lightingModel = .constant
//
//        let node = SCNNode(geometry: plane)
//        let constraint = SCNBillboardConstraint()
//        constraint.freeAxes = .Y
//        node.constraints = [constraint]
//        node.position = SCNVector3Make(0, 0, -50)
//
//        sceneView.scene.rootNode.addChildNode(node)
        
        let location = gestrueRecognize.location(in: sceneView)

        let hitResults = sceneView.hitTest(location, options: [SCNHitTestOption.searchMode : SCNHitTestSearchMode.closest.rawValue])
        if let hitTestNode: ResidentialAreaInformationNode = hitResults.first?.node as? ResidentialAreaInformationNode {
            hitTestNode.isSelected = !hitTestNode.isSelected
            selectedNode?.isSelected = !selectedNode!.isSelected
            selectedNode = hitTestNode
            infoView.configWith(name: hitTestNode.model.name, address: hitTestNode.model.address, distance: hitTestNode.model.distance, longitude: hitTestNode.model.longitude, latitude: hitTestNode.model.latitude)
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
