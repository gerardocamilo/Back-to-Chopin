//
//  ViewController.swift
//  Audio
//
//  Created by Gerardo Camilo on 7/7/15.
//  Copyright (c) 2015 ___GRCS___. All rights reserved.
//

import AVFoundation

import UIKit

var globalVariable:NSString = ""

class ViewController: UIViewController {

    @IBOutlet weak var playerValue: UISlider!
    var player: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func play(sender: AnyObject) {
        var audioPath = NSBundle.mainBundle().pathForResource("chopin-9-1-hammer", ofType: "mp3")
        
        var error:NSError? = nil
        
        player = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath!), error: &error)
        
        if error == nil {
            player.play()
        } else {
            println(error)
        }
        
    }

    @IBAction func pause(sender: AnyObject) {
        if player.playing {
            player.pause()
        } else {
            player.play()
        }
    }
    @IBAction func sliderChanged(sender: AnyObject) {
        
        player.volume = playerValue.value
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

