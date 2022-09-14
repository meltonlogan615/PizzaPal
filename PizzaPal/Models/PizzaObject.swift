//
//  PizzaObject.swift
//  PizzaPal
//
//  Created by Logan Melton on 9/14/22.
//

import Foundation

struct PizzaObject: Codable, Comparable {
  var cuts: [Cut]
  
  var diameter: Double
  
  var radius: Double {
    (diameter / 2)
  }
  
  var area: Double {
    pow(radius * 3.14, 2)
  }
  
  static func < (lhs: Self, rhs: Self) -> Bool {
    return lhs.diameter < rhs.diameter
  }
}
