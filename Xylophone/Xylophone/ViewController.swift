//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        guard let title = sender.currentTitle else {
            return
        }
        playSound(audioName: title)
        sender.layer.opacity = 0.2
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            sender.layer.opacity = 1
            timer.invalidate()
        }
    }

    func playSound(audioName: String) {
        guard let url = Bundle.main.url(forResource: audioName, withExtension: "wav") else {
            return
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else {return}
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
        
    }

}

