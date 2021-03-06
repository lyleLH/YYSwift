//
//  DoubleExtensions.swift
//  YYSwift
//
//  Created by Phoenix on 2017/11/27.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

#if canImport(CoreGraphics)
import CoreGraphics

// MARK: - Properties
public extension Double {
    
    /// YYSwift: Int.
    var int: Int {
        return Int(self)
    }
    
    /// YYSwift: Float.
    var float: Float {
        return Float(self)
    }
    
    /// YYSwift: CGFloat.
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
}

// MARK: - Operators

prefix operator √
/// YYSwift: Square root of double.
///
/// - Parameter double: double value to find square root for.
/// - Returns: square root of given double.
public prefix func √ (double: Double) -> Double {
    return sqrt(double)
}

precedencegroup PowerPrecedence {
    higherThan: MultiplicationPrecedence
}
infix operator ^ : PowerPrecedence
/// YYSwift: Value of exponentiation.
///
/// - Parameters:
///   - lhs: base double.
///   - rhs: exponent double.
/// - Returns: exponentiation result (example: 4.4 ^ 0.5 = 2.0976176963).
func ^ (lhs: Double, rhs: Double) -> Double {
    return pow(lhs, rhs)
}
#endif
