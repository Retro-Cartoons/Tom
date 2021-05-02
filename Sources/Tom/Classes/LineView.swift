//
//  LineView.swift
//  Tom
//
//  Created by Yusuf Demirci on 30.03.21.
//

import class UIKit.UIView
import class Foundation.NSCoder

class LineView: UIView {

    // MARK: Properties

    /// Line configuration parameters.
    private let configuration: LineConfiguration

    init(configuration: LineConfiguration) {
        self.configuration = configuration

        super.init(frame: .zero)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        switch configuration.cornerRadius {
        case .rounded:
            self.layer.cornerRadius = min(self.frame.width, self.frame.height) / 2
        case let .custom(radius):
            self.layer.cornerRadius = radius
        }
    }
}

// MARK: - Privates

private extension LineView {

    /// Set line background color as configurations color.
    func setup() {
        self.backgroundColor = configuration.color
    }
}
