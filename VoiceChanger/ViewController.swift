//
//  ViewController.swift
//  VoiceChanger
//
//  Created by Wadah Esam on 19/08/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var infoLabel: UILabel! // weak is a memory helper in swift
    
    var isRecording = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func startRecording(_ sender: Any) {
        if (!isRecording) {
            isRecording = true
            infoLabel.text = "Recording started"
        }
    }
    
    
    @IBAction func stopRecording(_ sender: Any) {
        if (isRecording) {
            isRecording = false
            infoLabel.text = "Recording Stopped"
        }
    }
}

