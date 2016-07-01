//
//  ViewController.swift
//  Caja de sonidos
//
//  Created by Alexis Araujo on 7/1/16.
//  Copyright © 2016 Alexis Araujo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player:AVAudioPlayer = AVAudioPlayer()
    let sound = ["bean", "belch", "giggle", "pew", "pig", "snore", "static", "uuu"]
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event!.subtype == UIEventSubtype.MotionShake {
            let randomNumber = Int(arc4random_uniform(UInt32(sound.count)))
            if let audioPath = NSBundle.mainBundle().pathForResource(self.sound[randomNumber], ofType: "mp3") {
                do {
                                    self.player = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
                    self.player.play()
                } catch let error as NSError {
                    print(error)
                }
            }
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

