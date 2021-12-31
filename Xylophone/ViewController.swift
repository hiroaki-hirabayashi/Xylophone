//
//  ViewController.swift
//  Xylophone
//
//  Created by Hiroaki-Hirabayashi on 2021/12/31.
//

import AVFoundation
import UIKit

final class ViewController: UIViewController {
    private var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func buttonPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
        
        // ボタンが押されたら不透明度を半分にする
        sender.alpha = 0.5
        
        // 0.2秒遅れて不透明度を元に戻す
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    private func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
        
        //        guard let url = Bundle.main.url(forResource: "C", withExtension: "wav") else { return }
        //
        //        do {
        //            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        //            try AVAudioSession.sharedInstance().setActive(true)
        //            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        //
        //            guard let player = player else { return }
        //            player.play()
        //        } catch let error {
        //            print(error.localizedDescription)
        //        }
        //
        //    }
        
    }
}
