//
//  ViewController.swift
//  EasyButton
//
//  Created by Chris Price on 5/28/20.
//  Copyright © 2020 com.chrispriiice. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    func playSound() {
        guard let url = Bundle.main.url(forResource: "easy", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func easyButtonPressed(_ sender: EasyButton) {
        UIView.animate(withDuration: 0.5, animations: {
            sender.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        }) { (_) in
            sender.transform = .identity
        }
        self.playSound()
    }
}

