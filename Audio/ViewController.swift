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
    var error:NSError? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var audioPath = NSBundle.mainBundle().pathForResource("chopin-9-1-hammer", ofType: "mp3")
        
        player = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath!), error: &error)
        
    }
    
    @IBAction func play(sender: AnyObject) {
        
        //If there was no error loading the track the app starts playing
        if error == nil {
            player.play()
        } else {
            println(error)
        }
        
    }

    @IBAction func pause(sender: AnyObject) {
        if player.playing {
            player.pause()
        }
    }
    
    @IBAction func sliderChanged(sender: AnyObject) {
        
        player.volume = playerValue.value
    }
    
    
    @IBAction func stop(sender: AnyObject) {
        player.stop()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

