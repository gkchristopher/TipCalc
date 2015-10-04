//
//  CalculatorBrain.swift
//  Tip Calculator
//
//  Created by Christopher J Moore on 10/4/15.
//  Copyright © 2015 Green Dragon Apps. All rights reserved.
//

import Foundation

class CalculatorBrain {
    var dollars: UInt?
    var cents: UInt?
    var bill: Double {
        get {
            guard let d = dollars, c = cents else {
                return 0.0
            }
            return Double(Double(d) + Double(c) / 100.0)
        }
    }
    var percent: Double?
    
    func calculate() -> Double {
        guard let myPercent = percent else {
            return 0
        }
        return bill * (1 + myPercent)
    }
    
    func split(numberOfPeople: UInt) -> Double {
        return bill / Double(numberOfPeople)
    }
}
