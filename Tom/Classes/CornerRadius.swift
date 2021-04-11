//
//  CornerRadius.swift
//  Tom
//
//  Created by Yusuf Demirci on 30.03.21.
//

import Foundation

/// Keys that specify a corner radius type.
enum CornerRadius {
    /// Keys that specify corner radius half of view's height.
    case rounded
    /// Keys that specify corner radius for developer selected radius
    case custom(CGFloat)
}
