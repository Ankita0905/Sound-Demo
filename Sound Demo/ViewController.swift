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
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateScrubber), userInfo: nil, repeats: true)
    }
    @IBAction func pauseSound(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    @IBAction func stopSound(_ sender: Any) {
        player.stop()
        timer.invalidate()
        player.currentTime=0
        
    }
    
    @objc func updateScrubber()
    {
        scrubber.value=Float(player.currentTime)
    }
    @IBAction func volumeChange(_ sender: UISlider) {
        player.volume=volumeSlider.value
    }
    
    @IBAction func changePosition(_ sender: UISlider) {
        player.currentTime=TimeInterval(scrubber.value)
        player.play()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            player=try AVAudioPlayer(contentsOf:URL(fileURLWithPath: path!))
            scrubber.maximumValue=Float(player.duration)
        }
        catch{
            print(error)
        }
       
        // Do any additional setup after loading the view.
    }


}

