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
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.init(white: 0, alpha: 0.8)
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var infoView: ResidentialAreaInformationView = {
        let view = ResidentialAreaInformationView(frame: CGRect(x: 0, y: 0, width: 200, height: 80))
        view.layoutIfNeeded()
        return view
    }()
    
    private lazy var node:SCNNode = {
        // 位置
        let nodePosition = SCNVector3Make(-20, 5, -500)
        
        let plane = SCNPlane(width: 200 , height: 80);
        plane.firstMaterial?.diffuse.contents = infoView.layer
        plane.firstMaterial?.lightingModel = .constant
        
        let constraint = SCNBillboardConstraint()
        constraint.freeAxes = .Y
        
        let node = SCNNode(geometry: plane)
        node.position = nodePosition;
        node.constraints = [constraint]
        return node
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        let configuration = AROrientationTrackingConfiguration()
        configuration.worldAlignment = .gravityAndHeading
        
        sceneView.session.run(configuration, options: [])
        
//        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//        
//        // Set the scene to the view
//        sceneView.scene = scene
        
        sceneView.scene.rootNode.addChildNode(node)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap(gestrueRecognize:)))
        
        view.addGestureRecognizer(tapGesture)
    }
    
    func setUpUI() {
        view.addSubview(infoLabel)
        let views = ["infoLabel" : infoLabel]
        
        let infoLabelConstraintH = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[infoLabel]-0-|", options: [], metrics: nil, views: views)
        let infoLabelConstraintV = NSLayoutConstraint.constraints(withVisualFormat: "V:[infoLabel(100)]-0-|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activate(infoLabelConstraintH + infoLabelConstraintV)
    }
    
    @objc
    func handleTap(gestrueRecognize: UITapGestureRecognizer) {
        let location = gestrueRecognize.location(in: sceneView)
        
        let hitResults = sceneView.hitTest(location, options: [SCNHitTestOption.searchMode : SCNHitTestSearchMode.closest.rawValue])
        if let hitTestNode = hitResults.first?.node, hitTestNode == node {
            self.infoView.backgroundView.image = #imageLiteral(resourceName: "map_bubble_selected").stretchableImage(withLeftCapWidth: 20, topCapHeight: 20)
            self.infoLabel.text = "融泽嘉园二期2号楼"
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
