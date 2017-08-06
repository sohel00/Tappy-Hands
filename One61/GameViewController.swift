//
//  GameViewController.swift
//  One61
//
//  Created by Sohel Dhengre on 7/29/17.
//  Copyright © 2017 Sohel Inc. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var scorelabel: UILabel!
    @IBOutlet var timelabel: UILabel!
    
    @IBOutlet var button: UIButton!

    var TapInt = 0
    var startint = 3
    var starttimer = Timer()
    
    var gameInt = 10
    var gameTimer = Timer()
    
    var recordData:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    label1.layer.cornerRadius = 6.0
        label2.layer.cornerRadius = 6.0
        button.layer.cornerRadius = 6.0
        
        gameInt = 10
        timelabel.text = String(gameInt)
        
        
        TapInt = 0
        scorelabel.text = String(TapInt)
        
        startint = 3
        button.setTitle(String(startint), for: .normal)
        button.isEnabled = false
    
        starttimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.startGameTimer), userInfo: nil, repeats: true)
    

    let userDefaults = Foundation.UserDefaults.standard
        let value = userDefaults.string(forKey: "Record")
        recordData = value
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    @IBAction func TapMeButton(_ sender: Any) {
     TapInt += 1
        scorelabel.text = String(TapInt)
    
    }
   
    func startGameTimer() {
        startint -= 1
        button.setTitle(String(startint), for: .normal)
    
        if startint == 0{
            starttimer.invalidate()
            button.setTitle("Tap Me", for: .normal)
            button.isEnabled = true
            gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.game), userInfo: nil, repeats: true)
        }
    
    }
    
    
    func game(){
        gameInt -= 1
        timelabel.text = String(gameInt)
        
        if gameInt == 0{
            gameTimer.invalidate()
            
            if recordData == nil{
            let savedString = scorelabel.text
            let userDefaults = Foundation.UserDefaults.standard
            userDefaults.set(savedString, forKey: "Record")
            } else {
                
                let score:Int? = Int(scorelabel.text!)
                let record:Int? = Int(recordData!)
                
                if score! > record!{
                   
                    let savedString = scorelabel.text
                    let userDefaults = Foundation.UserDefaults.standard
                    userDefaults.set(savedString, forKey: "Record")
                }
                
                
            }
            
            
            
            
            button.isEnabled = false
            
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(GameViewController.end), userInfo: nil, repeats: false)
        }
    }
  
    func end(){
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "endGame") as! EndViewController
        vc.scoreData = scorelabel.text
        self.present(vc, animated: false, completion: nil)
    }
    
}


