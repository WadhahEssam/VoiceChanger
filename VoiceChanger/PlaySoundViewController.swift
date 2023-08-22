//
//  PlaySoundViewController.swift
//  VoiceChanger
//
//  Created by Wadah Esam on 21/08/2023.
//

import UIKit

class PlaySoundViewController: UIViewController {
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let recordedAudioURL = self.recordedAudioURL {
            print(recordedAudioURL)
        }
    }
    
    @IBAction func playSound(_ sender: UIButton) {
        // in swift you actually can do equality check on instances

        switch sender {
            case snailButton:
                print("snail button")
            case rabbitButton:
                print("rabbit button")
            case chipmunkButton:
                print("chipmunk button")
            case vaderButton:
                print("vader button")
            case echoButton:
                print("echo button")
            case reverbButton:
                print("reverb button")
            default:
                print("couldn't find the button")
        }
    }
    
    @IBAction func stopSound(_sender: UIButton) {
        print("stop button")
    }
}
