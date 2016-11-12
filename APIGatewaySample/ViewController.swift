//
//  ViewController.swift
//  APIGatewaySample
//
//  Created by Matthew Pileggi on 11/11/16.
//  Copyright © 2016 Matthew Pileggi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func post() {

        let model: APISAMPLENoteCreateModel! = APISAMPLENoteCreateModel()
        model.note = "TEST NOTE"
        model.noteid = "TEST NOTE ID"
        
        APISAMPLESampleClient.defaultClient().rootPost(body: model).continue({ task in
            if task.error != nil {
           
                let error = task.error as! NSError
                print(error.userInfo["__type"] ?? "No message")
                
            } else {
                print("SUCCESS")
                print(task.result ?? "no readable result")
            }
            return nil
        })
        
    }

}

