//
//  PlaySoundViewController.swift
//  VoiceChanger
//
//  Created by Wadah Esam on 21/08/2023.
//

import UIKit

class PlaySoundViewController: UIViewController {
    var recordedAudioURL: URL!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let recordedAudioURL = self.recordedAudioURL {
            print(recordedAudioURL)
        }
    }
}
