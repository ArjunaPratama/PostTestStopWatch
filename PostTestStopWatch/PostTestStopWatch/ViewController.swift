//
//  ViewController.swift
//  PostTestStopWatch
//
//  Created by DOTS2 on 10/23/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //deeklarasi variable counter
    var counter = 0.0
    //deklarasi timer
    var timer = Timer()
    //deklarasi isPlaying
    var isPlaying = false
    @IBOutlet weak var labelTimer: UILabel!
    
    @IBOutlet weak var labelStop: UIButton!
    @IBOutlet weak var labelPause: UIButton!
    @IBOutlet weak var labelStart: UIButton!
    override func viewDidLoad() {
        
        //menampilkan teks ke label timer
        labelTimer.text = String(counter)
        //agar button pause tidak aktif
        labelPause.isEnabled = false
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "wallpaper.wiki-Adventure-Time-Iphone-Background-1920x1080-PIC-WPD005957-3")
        self.view.insertSubview(backgroundImage, at: 0)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func btnStart(_ sender: Any) {
        
        //mengecek apakah sedang playing atau tidak
        if(isPlaying){
            return
        }
        
        //button start tidak aktif
        labelStart.isEnabled = false
        //button pause aktif
        labelPause.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        
        
        //mengatur isPlaying nya true
        isPlaying = true    }
    @objc func UpdateTimer(){
    
        counter = counter + 0.1
        labelTimer.text = String(format: "%.1f", counter)
    }
    @IBAction func btnPause(_ sender: Any) {
        //aggar button start aktif
        labelStart.isEnabled = true
        //agar button pause tidak aktif
        labelPause.isEnabled = false
        
        //menampilkan data yang valid
        timer.invalidate()
        
        //menampilkam isplaying false
        isPlaying = false
    }
    
    @IBAction func btnStop(_ sender: Any) {
        //aggar button start aktif
        labelStart.isEnabled = true
        //agar button pause tidak aktif
        labelPause.isEnabled = false
        
        //menampilkan data yang valid
        timer.invalidate()
        
        //menampilkam isplaying false
        isPlaying = false
        
        //mengatur counter menjadi 0 kembali
        counter = 0.0
        //menampilkan timer ke label
        //fungsi dari strin(counter) adalah mengubah nilai desimal counter ke dalam bentuk string
        labelTimer.text = String(counter)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

