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

    @IBOutlet weak var tomView: TomView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    /* Remove comment to programmatically implementation work
    private lazy var tomView = TomView(configuration: .init(lineCount: 20, lineColor: retroCartoonsBlack))
    */

    override func viewDidLoad() {
        super.viewDidLoad()

        tomView.backgroundColor = UIColor(named: "retroCartoonsYellow")

        /* Remove comment to programmatically implementation work
        addTomView()
        */
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        startButton.layer.cornerRadius = min(startButton.frame.width, startButton.frame.height) / 2
        stopButton.layer.cornerRadius = min(stopButton.frame.width, stopButton.frame.height) / 2
    }
    
    @IBAction func startAction(_ sender: UIButton) {
        tomView.start()
    }
    
    @IBAction func stopAction(_ sender: UIButton) {
        tomView.stop()
    }
}

// MARK: - Privates

private extension ViewController {

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
}
