//
//  ViewController.swift
//  iKid
//
//  Created by iGuest on 11/1/16.
//  Copyright © 2016 Elizabeth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var joke: UIView!
    
    @IBOutlet weak var answer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

                joke.isHidden = true
        answer.isHidden = false

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func nextButton(_ sender: AnyObject) {
        answer.isHidden = false
        joke.isHidden = true
    }
}

