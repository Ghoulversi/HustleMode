//
//  ViewController.swift
//  hustle-mode
//
//  Created by Minami on 12/10/17.
//  Copyright © 2017 Minami. All rights reserved.
//

import UIKit
import AVFoundation


class LunchAndReset: UIViewController {

    
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustleLbl: UILabel!
    @IBOutlet weak var onLbl: UILabel!
    @IBOutlet weak var ResetBtn: UIButton!
    
    var player: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }

    @IBAction func powerBtnPressed(_ sender: Any) {

    cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        ResetBtn.isHidden = false
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 180, width: 375, height: 284)
        }) { (finished) in
            self.hustleLbl.isHidden = false
            self.onLbl.isHidden = false
        }
    
    }

    @IBAction func ResetBtn(_ sender: Any) {
        cloudHolder.isHidden = true
        darkBlueBG.isHidden = false
        powerBtn.isHidden = false
        ResetBtn.isHidden = true
        hustleLbl.isHidden = true
        onLbl.isHidden = true
        player.stop()
        UIView.animate(withDuration: 0.5, animations: {
            self.rocket.frame = CGRect(x: 0, y: 180, width: 0, height: 0)
        })
    }
    

}

