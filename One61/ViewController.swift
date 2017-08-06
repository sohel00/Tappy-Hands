//
//  ViewController.swift
//  One61
//
//  Created by Sohel Dhengre on 7/29/17.
//  Copyright © 2017 Sohel Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var button: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    label1.layer.cornerRadius = 6.0
    button.layer.cornerRadius = 6.0
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults = Foundation.UserDefaults.standard
        let value = userDefaults.string(forKey: "Record")
        
        if (value == nil){
            label2.text = "0"
        }
        else{
            label2.text = value
        }
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

