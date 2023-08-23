//
//  RecordSoundsViewController.swift
//  VoiceChanger
//
//  Created by Wadah Esam on 19/08/2023.
//

import UIKit
import AVFoundation

enum RecordingState { case recording, idle }

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    var audioRecorder: AVAudioRecorder!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel! // weak is a memory helper in swiftK
    
    var recordingState: RecordingState = .idle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // you always call the super class before doing your own implementation
        updateButtons(.idle)
    }
    
    private func updateButtons(_ newRecordingState: RecordingState) {
        if (newRecordingState == .recording) {
            infoLabel.text = "Started"
            recordingState = .recording
        } else if (newRecordingState == .idle) {
            recordingState = .idle
            infoLabel.text = "Tap To Record"
        }
        stopRecordButton.isEnabled = recordingState == .recording
        recordButton.isEnabled = recordingState == .idle
    }
    
    @IBAction func startRecording(_ sender: Any) {
        updateButtons(.recording)
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(.playAndRecord, mode: .default)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:]) // if an error happens, it will throw a runtime crash
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    
    @IBAction func stopRecording(_ sender: Any) {
        updateButtons(.idle)
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }

    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if (flag) {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("recording failed")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "stopRecording") {
            let playSoundsVC = segue.destination as! PlaySoundViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
}

