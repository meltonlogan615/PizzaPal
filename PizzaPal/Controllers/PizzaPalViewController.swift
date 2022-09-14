//
//  ViewController.swift
//  PizzaPal
//
//  Created by Logan Melton on 9/13/22.
//

import UIKit
import RealityKit

class PizzaPalViewController: UIViewController {
    
  @IBOutlet weak var PizzaView: ARView!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! StarterScene.loadBox()
        
        // Add the box anchor to the scene
//      PizzaView.scene.anchors.append(boxAnchor)
    }
}
