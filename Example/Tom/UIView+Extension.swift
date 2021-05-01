//
//  UIView+Extension.swift
//  Tom_Example
//
//  Created by Yusuf Demirci on 01.05.21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

extension UIView {

    func pinView(to view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
