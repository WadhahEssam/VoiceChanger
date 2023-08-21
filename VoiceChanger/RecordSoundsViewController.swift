//
//  RecordSoundsViewController.swift
//  VoiceChanger
//
//  Created by Wadah Esam on 19/08/2023.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController {
    var audioRecorder: AVAudioRecorder!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel! // weak is a memory helper in swiftK
    
    var isRecording = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // you always call the super class before doing your own implementation
        updateButtonsAvailability()
    }

    private func updateButtonsAvailability() {
        stopRecordButton.isEnabled = isRecording
        recordButton.isEnabled = !isRecording
    }

    @IBAction func startRecording(_ sender: Any) {
        if (!isRecording) {
            isRecording = true
            infoLabel.text = "Started"
        }
        updateButtonsAvailability()
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        print(filePath!)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(.playAndRecord, mode: .default)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:]) // if an error happens, it will throw a runtime crash
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    
    @IBAction func stopRecording(_ sender: Any) {
        if (isRecording) {
            isRecording = false
            infoLabel.text = "Stopped"
        }
        updateButtonsAvailability()
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
}

