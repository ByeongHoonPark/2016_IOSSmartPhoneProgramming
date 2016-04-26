//
//  ViewController.swift
//  2011181015_Homework1_StopWatch
//
//  Created by kpugame on 2016. 3. 17..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var timerLabel: UILabel!
    
    var isStart: Bool = false
    var minutes = 0
    var seconds = 0
    var miliseconds = 0
    
    var timer = NSTimer()
    
    @IBAction func startButtonPressed(){
        if(!timer.valid)
        {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("increseTime"), userInfo: nil, repeats: true)
        }
    }
    @IBAction func stopButtonPressed(){
        timer.invalidate()
        
    }
    @IBAction func resetButtonPressed(){
        setupTimer()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func increseTime()
    {
        miliseconds += 1
        if( miliseconds == 10)
        {
            miliseconds = 0
            seconds += 1
            
        }
        if( seconds == 60)
        {
            seconds = 0
            minutes += 1
        }
        timerLabel.text = String().stringByAppendingFormat("%.2d:%.2d:%.2d",minutes,seconds,miliseconds)
    }
    
    func setupTimer(){
        minutes = 0
        seconds = 0
        miliseconds = 0
        timerLabel.text = "00:00:00"
        timer.invalidate()
        
    }
    

}

