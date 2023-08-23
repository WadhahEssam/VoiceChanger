//
//  PlaySoundViewController.swift
//  VoiceChanger
//
//  Created by Wadah Esam on 21/08/2023.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }
    
    @IBAction func playSound(_ sender: UIButton) {
        // in swift you actually can do equality check on instances

        switch sender {
        case snailButton:
            playSound(rate: 0.5)
        case rabbitButton:
            playSound(rate: 1.5)
        case chipmunkButton:
            playSound(pitch: 1000)
        case vaderButton:
            playSound(pitch: -1000)
        case echoButton:
            playSound(echo: true)
        case reverbButton:
            playSound(reverb: true)
        default:
            print("couldn't find the button")
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopSound(_sender: UIButton) {
        stopAudio()
    }
}
