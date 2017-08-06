//
//  EndViewController.swift
//  One61
//
//  Created by Sohel Dhengre on 7/30/17.
//  Copyright © 2017 Sohel Inc. All rights reserved.
//

import UIKit
import Social

class EndViewController: UIViewController {
    
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var scorelabel: UILabel!
    
    var scoreData:String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
       label1.layer.cornerRadius = 6.0
        label2.layer.cornerRadius = 6.0
        button1.layer.cornerRadius = 6.0
        button2.layer.cornerRadius = 6.0
        button3.layer.cornerRadius = 6.0
        button4.layer.cornerRadius = 6.0

    scorelabel.text = scoreData
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func restartGame(_ sender: Any) {
    
    self.dismiss(animated: false, completion: nil)
    self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func shareTwitter(_ sender: Any) {
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
        let twitter:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        twitter.setInitialText("My Final Score is \(scorelabel.text!)")
            self.present(twitter, animated: true, completion: nil)
        
        }
        else{
            
            let alert = UIAlertController(title: "Accounts", message: "Please login to your twitter account within the settings", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    

    @IBAction func shareFb(_ sender: Any) {
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
            let fb:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            fb.setInitialText("My Final Score is \(scorelabel.text!)")
            self.present(fb, animated: true, completion: nil)
            
        }
        else{
            
            let alert = UIAlertController(title: "Accounts", message: "Please login to your Facebook account within the settings", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }

        
    }
    
    
}
