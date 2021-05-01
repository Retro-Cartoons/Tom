//
//  ViewController.swift
//  Tom
//
//  Created by demirciy on 03/25/2021.
//  Copyright (c) 2021 demirciy. All rights reserved.
//

import AVKit
import Tom
import UIKit

class ViewController: UIViewController {

    // MARK: Properties

    @IBOutlet weak var playerContainerView: UIView!
    @IBOutlet weak var tomView: TomView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    private let playerController: AVPlayerViewController = {
        let controller: AVPlayerViewController = .init()
        controller.showsPlaybackControls = false
        return controller
    }()
    private var playerStatusObserver: Any?

    // MARK: Actions

    @IBAction func startAction(_ sender: UIButton) {
        playerController.player?.play()
    }

    @IBAction func stopAction(_ sender: UIButton) {
        playerController.player?.pause()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPlayer()
        observePlayer()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        startButton.layer.cornerRadius = min(startButton.frame.width, startButton.frame.height) / 2
        stopButton.layer.cornerRadius = min(stopButton.frame.width, stopButton.frame.height) / 2
    }
}

// MARK: - Privates

private extension ViewController {

    func setupPlayer() {
        playerContainerView.addSubview(playerController.view)
        playerController.view.pinView(to: playerContainerView)

        guard let exampleVideoPath = Bundle.main.path(forResource: "ExampleVideo", ofType: "mp4") else {
            debugPrint("Example video not found")
            return
        }

        let exampleVideoUrl = URL(fileURLWithPath: exampleVideoPath)

        let player: AVPlayer = .init(url: exampleVideoUrl)
        playerController.player = player
    }

    func observePlayer() {
        playerStatusObserver = playerController.player?.observe(\.timeControlStatus, options: [.new], changeHandler: { player, _ in
            switch player.timeControlStatus {
            case .playing:
                self.tomView.start()
            case .paused:
                self.tomView.stop()
            default:
                break
            }
        })
    }
}
