//
//  Configuration.swift
//  Tom
//
//  Created by Yusuf Demirci on 30.03.21.
//

public struct Configuration {

    public let lineCount: Int
    public let lineColor: UIColor
    public let lineSpacing: CGFloat
    public let axis: UILayoutConstraintAxis = .horizontal
    public let minLineHeight: CGFloat
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
