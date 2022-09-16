//
//  PizzaRing.swift
//  PizzaPal
//
//  Created by Logan Melton on 9/15/22.
//

import Foundation
import SceneKit

class PizzaRing: SCNNode {
  init(detail: Int = 500) {
    super.init()
    
    let elements = self.generateElements(detail: detail)
    let circleSources = self.generateCircleGeometrySources(detail: detail)
    let materials = self.generateMaterials()
    
    let circleGeometry = SCNGeometry(sources: circleSources, elements: elements)
    
    self.geometry = circleGeometry
    self.geometry?.materials = materials
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func generateMaterials() -> [SCNMaterial] {
    
    let material = SCNMaterial()
    material.isDoubleSided = true
    material.lightingModel = .constant
    material.blendMode = .add
    material.diffuse.contents = UIImage(named: "art.scnassets/orbit_gradient.png")
    
    return [material]
  }
  
  private func generateElements(detail: Int) -> [SCNGeometryElement] {
    
    var indices: [Int32] = []
    
    for i in 0..<detail-1 {
      indices.append(Int32(i))
      indices.append(Int32(i+1))
    }
    
    return [SCNGeometryElement(indices: indices, primitiveType: .line)]
  }
  
  private func generateCircleGeometrySources(detail: Int) -> [SCNGeometrySource] {
    
    var verticesVectors = [SCNVector3]()
    var textureCoordsPoints = [CGPoint]()
    
    for i in 0..<detail {
      let per = Float(i) / Float(detail-1)
      let angle = per * (Float.pi * 2)
      
      let vertice = SCNVector3(cos(angle), sin(angle), 0)
      let texture = CGPoint(x: Double(per), y: 0.5)
      
      verticesVectors.append(vertice)
      textureCoordsPoints.append(texture)
    }
    
    let vertices = SCNGeometrySource(vertices: verticesVectors)
    let textureCoords = SCNGeometrySource(textureCoordinates: textureCoordsPoints)
    
    return [vertices, textureCoords]
  }
  
  
}
