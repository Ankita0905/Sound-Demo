//
//  ViewController.swift
//  Sound Demo
//
//  Created by Ankita Jain on 2020-01-07.
//  Copyright © 2020 Ankita Jain. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    let path=Bundle.main.path(forResource: "bach", ofType: "mp3")
    
    var timer=Timer()

    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var scrubber: UISlider!
    @IBAction func playSound(_ sender: Any) {
        player.play()
    }
    @IBAction func pauseSound(_ sender: Any) {
    }
    @IBAction func stopSound(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

