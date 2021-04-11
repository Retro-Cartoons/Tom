//
//  Configuration.swift
//  Tom
//
//  Created by Yusuf Demirci on 30.03.21.
//

/// Configuration parameters for TomView.
public struct Configuration {
    
    /// Determines how many lines will be in TomView.
    public let lineCount: Int
    /// Determines the color of the lines in TomView.
    public let lineColor: UIColor
    /// Determines spacing between each line.
    public let lineSpacing: CGFloat
    /// /// Determines axis of lines, horizontal or vertical.
    public let axis: UILayoutConstraintAxis = .horizontal
    /// Determines minimum line height in TomView
    public let minLineHeight: CGFloat
    /// Determines animation duration for the line animation.
    public let animationSpeed: TimeInterval

    public init(lineCount: Int,
                lineColor: UIColor,
                spacing: CGFloat = 8,
                minLineHeight: CGFloat = 8,
                animationSpeed: TimeInterval = 0.25) {
        self.lineCount = lineCount
        self.lineColor = lineColor
        self.lineSpacing = spacing
        self.minLineHeight = minLineHeight
        self.animationSpeed = animationSpeed
    }
}
