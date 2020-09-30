//
//  ViewController.swift
//  MusicPlayer
//
//  Created by 장기화 on 2020/09/07.
//  Copyright © 2020 soduma. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var player: AVAudioPlayer!
    var timer: Timer!
    
    
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func initializePlayer(){
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound")
        else {
            print("음원 파일을 가져올 수 없습니다.")
            return
        }
        
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
        self.progressSlider.maximumValue = Float(self.player.duration)
        self.progressSlider.minimumValue = 0
        self.progressSlider.value = Float(self.player.currentTime)
    }
    
    func updateTimeLabelText(time: TimeInterval) {
        let minute: Int = Int(time / 60)
        let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
        let milisecond: Int = Int(time.truncatingRemainder(dividingBy: 1) * 180)
        
        let timeText: String = String(format: "%02ld:%02ld:%02ld", minute, second, milisecond)
        
        self.timeLabel.text = timeText
    }
    
    func makeAndFireTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [unowned self] (timer: Timer) in
            
            if self.progressSlider.isTracking {return}
            
            self.updateTimeLabelText(time: self.player.currentTime)
            self.progressSlider.value = Float(self.player.currentTime)
        })
        self.timer.fire()
    }
    
    
    
    
    
    @IBAction func touchUpPlayPauseButton(_ sender: Any) {
        print("touch tapped")
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print("slider value changed")
    }
}

