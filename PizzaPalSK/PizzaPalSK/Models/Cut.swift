//
//  Cut.swift
//  PizzaPal
//
//  Created by Logan Melton on 9/14/22.
//

import Foundation

struct Cut: Codable, Comparable {
  
  var start: Int
  var end: Int
  
  static func < (lhs: Self, rhs: Self) -> Bool {
    return lhs.start < rhs.start
  }
  
  mutating func setCutCount(for slices: Slices) -> [(Int, Int)] {
    var cuts = [(Int, Int)]()
    switch slices {
      case .eight:
        cuts = [(0, 180), (45, 225), (90, 270), (135, 315)]
      case .six:
        cuts = [(0, 180), (60, 240), (120, 300)]
      case .four:
        cuts = [(0, 180), (90, 270)]
      case .two:
        cuts = [(0, 180)]
      case .smallSquare:
        cuts = [(0, 180)]
      case .mediumSquare:
        cuts = [(0, 180)]
      case .largeSquare:
        cuts = [(0, 180)]
    }
    return cuts
  }
}
