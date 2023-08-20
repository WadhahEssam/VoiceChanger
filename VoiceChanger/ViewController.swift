//
//  ViewController.swift
//  VoiceChanger
//
//  Created by Wadah Esam on 19/08/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel! // weak is a memory helper in swift
    
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
    }
    
    
    @IBAction func stopRecording(_ sender: Any) {
        if (isRecording) {
            isRecording = false
            infoLabel.text = "Stopped"
        }
        updateButtonsAvailability()
    }
}

