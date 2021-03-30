//
//  ViewController.swift
//  Tom
//
//  Created by demirciy on 03/25/2021.
//  Copyright (c) 2021 demirciy. All rights reserved.
//

import Tom
import UIKit

class ViewController: UIViewController {

    // MARK: Properties

    private lazy var tomView = TomView(configuration: .init(lineCount: 20, lineColor: retroCartoonsBlack))
    private lazy var actionButtonStackView: UIStackView = {
        let view: UIStackView = .init(arrangedSubviews: [startButton, stopButton])
        view.axis = .horizontal
        view.spacing = 32
        view.distribution = .fillEqually
        return view
    }()
    private lazy var startButton: UIButton = {
        let button: UIButton = .init()
        button.backgroundColor = retroCartoonsBlack
        button.setTitleColor(retroCartoonsYellow, for: .normal)
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(startAction), for: .touchUpInside)
        return button
    }()
    private lazy var stopButton: UIButton = {
        let button: UIButton = .init()
        button.backgroundColor = retroCartoonsBlack
        button.setTitleColor(retroCartoonsYellow, for: .normal)
        button.setTitle("Stop", for: .normal)
        button.addTarget(self, action: #selector(stopAction), for: .touchUpInside)
        return button
    }()

    private let retroCartoonsYellow: UIColor = .init(red: 228 / 255, green: 186 / 255, blue: 94 / 255, alpha: 1)
    private let retroCartoonsBlack: UIColor = .init(red: 35 / 255, green: 21 / 255, blue: 24 / 255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = retroCartoonsYellow

        addTomView()
        addButtons()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        startButton.layer.cornerRadius = min(startButton.frame.width, startButton.frame.height) / 2
        stopButton.layer.cornerRadius = min(stopButton.frame.width, stopButton.frame.height) / 2
    }
}

// MARK: - Privates

private extension ViewController {

    @objc func startAction() {
        tomView.start()
    }

    @objc func stopAction() {
        tomView.stop()
    }

    func addTomView() {
        self.view.addSubview(tomView)

        tomView.translatesAutoresizingMaskIntoConstraints = false

        tomView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 64)
            .isActive = true
        tomView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -64)
            .isActive = true
        tomView.heightAnchor.constraint(equalToConstant: 200)
            .isActive = true
        tomView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100)
            .isActive = true
        tomView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            .isActive = true
    }

    func addButtons() {
        self.view.addSubview(actionButtonStackView)

        actionButtonStackView.translatesAutoresizingMaskIntoConstraints = false

        actionButtonStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 32)
            .isActive = true
        actionButtonStackView.topAnchor.constraint(equalTo: tomView.bottomAnchor, constant: 128)
            .isActive = true
        actionButtonStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -32)
            .isActive = true
        actionButtonStackView.heightAnchor.constraint(equalToConstant: 50)
            .isActive = true
    }
}
