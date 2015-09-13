//
//  ViewController.swift
//  Stop Watch
//
//  Created by Abe Schonfeld on 9/13/15.
//  Copyright (c) 2015 Abe Schonfeld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var time: UILabel!
    
    @IBOutlet var startButton: UIButton!

    var timer = NSTimer()
    var count = 0
    var isPaused = true
    
    func updateTime() {
        count++
        time.text = getDisplayTime()
    }
    
    func updateStartButton() {
        startButton.setTitle(isPaused ? "Start" : "Pause", forState: .Normal)
    }
    
    func getDisplayTime() -> String {
        return "\(count / 10).\(count % 10)"
    }
    

    
    @IBAction func start(sender: AnyObject) {
        
        if isPaused {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
            isPaused = false
            updateStartButton()
        } else {
            timer.invalidate()
            isPaused = true
            updateStartButton()
        }
        
        
    }
    @IBAction func reset(sender: AnyObject) {
        timer.invalidate()
        isPaused = true
        updateStartButton()
        count = 0
        time.text = "0.0"
        
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

