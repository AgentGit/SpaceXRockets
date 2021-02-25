//
//  Int+Ext.swift
//  SpaceXRockets
//
//  Created by Chad Goodyear on 25/2/21.
//

import Foundation

// Stolen from: https://stackoverflow.com/questions/35854069/convert-high-numbers-to-lower-format
extension Int {
  func shortLiteralDescription() -> String {
        var factor = 0
        let tokens = ["","K", "M", "G","T","P"]
        var value = Double(self);
        while (value > 1000) {
            value /= 1000
            factor += 1
        }
        return "\(value)\(tokens[factor])"
    }
}
