//
//  ViewController.swift
//  iKid
//
//  Created by iGuest on 11/1/16.
//  Copyright © 2016 Elizabeth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var joke: UIView!
    @IBOutlet var answer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        if joke != nil {
//            joke.isHidden = false
//        }
//        
//        if answer != nil {
//            answer.isHidden = true
//        }
        
//        if joke != nil  && answer != nil {
//            print("???")
//            UIView.transition(from: answer, to: joke, duration: 0.1, options: .transitionFlipFromLeft, completion: nil)
//        }
    }

    @IBAction func nextButton(_ sender: AnyObject) {
//        answer.isHidden = false
//        joke.isHidden = true
        
        UIView.transition(from: joke, to: answer, duration: 1.0, options: .transitionFlipFromLeft, completion: { (finished: Bool) -> Void in
            sleep(1)
            UIView.transition(from: self.answer, to: self.joke, duration: 1.0, options: .transitionFlipFromRight, completion: nil)
            }
        )
    }
}

