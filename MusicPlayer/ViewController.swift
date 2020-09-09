//
//  ViewController.swift
//  MusicPlayer
//
//  Created by 장기화 on 2020/09/07.
//  Copyright © 2020 soduma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpPlayPauseButton(_ sender: Any) {
        print("button tapped")
    }
}

