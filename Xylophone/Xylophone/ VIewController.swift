//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer!
    
//    var selectedSoundFileName: String = "" Option 1 - Declaring this variable over here allows it to be global, because before it couldn't be sone from the IBAction function. It was out of scope. We had to initialize it here
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
//        selectedSoundFileName = soundArray[sender.tag - 1] Option 1 - Now we can assign a valua to the variable since it's global. This allows us to use the sender parameter with is only possible within this funcion
        
        playSound(soundFileName: soundArray[sender.tag - 1])

    }
    
    
    func playSound(soundFileName: String) {
        
//        let soundURL = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav")
        let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav") // In this option we declared a parameter and having this input option we don't have to declare a variable and it doesn't have to be global or local variable 
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
    }

}
