//
//  Configuration.swift
//  Tom
//
//  Created by Yusuf Demirci on 30.03.21.
//

import UIKit

/// Configuration parameters for TomView.
public struct Configuration {
    
    /// Determines how many lines will be in TomView.
    public let lineCount: Int
    /// Determines the color of the lines in TomView.
    public let lineColor: UIColor
    /// Determines spacing between each line.
    public let lineSpacing: CGFloat
    /// Determines axis of lines, horizontal or vertical.
    public let axis: NSLayoutConstraint.Axis
    /// Determines minimum line thickness in TomView
    public let minLineThickness: CGFloat
    /// Determines animation duration for the line animation.
    public let animationSpeed: Double

    public init(lineCount: Int,
                lineColor: UIColor,
                lineSpacing: CGFloat = 8,
                axis: NSLayoutConstraint.Axis = .horizontal,
                minLineThickness: CGFloat = 8,
                animationSpeed: Double = 0.25) {
        self.lineCount = lineCount
        self.lineColor = lineColor
        self.lineSpacing = lineSpacing
        self.axis = axis
        self.minLineThickness = minLineThickness
        self.animationSpeed = animationSpeed
    }
}
