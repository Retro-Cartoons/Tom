//
//  UIView+Extension.swift
//  Tom
//
//  Created by Yusuf Demirci on 30.03.21.
//

extension UIView {
    
    /// Returns height contraint of related view.
    var heightConstraint: NSLayoutConstraint? {
        constraints.first { $0.firstAttribute == .height && $0.relation == .equal }
    }
}

extension UIView {

    /// Pins edges to methods input view.
    /// - Parameter view: Input parameter is type of UIView object or subobject of UIView type.
    func pinView(to view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
