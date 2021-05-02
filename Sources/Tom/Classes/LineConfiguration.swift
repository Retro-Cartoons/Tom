//
//  LineConfiguration.swift
//  Tom
//
//  Created by Yusuf Demirci on 30.03.21.
//

import class UIKit.UIColor

struct LineConfiguration {

    /// Determines which color the line will be.
    let color: UIColor
    /// Determines corner radius of line.
    var cornerRadius: CornerRadius = .custom(0)
}
