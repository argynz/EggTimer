//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ttitle: UILabel!
    @IBOutlet weak var progree: UIProgressView!
    let boilTime = ["Soft":3,"Medium":4,"Hard":7]
    var timer = Timer()
    var boil = 60
    var boil1 = 60
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let text = sender.currentTitle!
        boil = boilTime[text]!
        timer.invalidate()
        boil1 = boil
        progree.progress = 1
        ttitle.text = text
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
                    
    }
    
    @objc func updateTimer(){
        if boil > 0 {
            print("\(boil) seconds.")
            progree.progress = Float(boil) / Float(boil1)
            boil -= 1
        }
        else {
            timer.invalidate()
            progree.progress = 0
            ttitle.text = "DONE!!!"
        }
    }
    
}
