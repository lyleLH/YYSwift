//
//  FloatingPointExtensions.swift
//  YYSwift
//
//  Created by Phoenix on 2017/11/29.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

#if canImport(Foundation)
import Foundation

// MARK: - Properties
public extension FloatingPoint {
    
    /// YYSwift: Absolute value of integer number.
    public var abs: Self {
        return Swift.abs(self)
    }
    
    /// YYSwift: Check if integer is positive.
    public var isPositive: Bool {
        return self > 0
    }
    
    /// YYSwift: Check if integer is negative.
    public var isNegative: Bool {
        return self < 0
    }
    
    /// YYSwift: Ceil of number.
    public var ceil: Self {
        return Foundation.ceil(self)
    }
    
    /// YYSwift: Floor of number.
    public var floor: Self {
        return Foundation.floor(self)
    }
    
    /// YYSwift: Radian value of degree input.
    public var degreesToRadians: Self {
        return Self.pi * self / Self(180)
    }
    
    /// YYSwift: Degree value of radian input.
    public var radiansToDegrees: Self {
        return self * Self(180) / Self.pi
    }
}


prefix operator ±
/// YYSwift: Tuple of plus-minus operation.
///
/// - Parameter int: number
/// - Returns: tuple of plus-minus operation (± 2.5 -> (2.5, -2.5)).
public prefix func ±<T: FloatingPoint> (number: T) -> (T, T) {
    return (0 + number, 0 - number)
}
#endif
