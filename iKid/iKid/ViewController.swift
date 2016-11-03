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
    var type = ""
    var knockJokes = ["knock knock", "who's there?", "aaa", "aaa who?", "aafiefojk"]
    var knockCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        type = title!
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
        print(type)
        if type != "Dad" {
            UIView.transition(from: joke, to: answer, duration: 1.0, options: .transitionFlipFromLeft, completion: { (finished: Bool) -> Void in
                usleep(750000)
                UIView.transition(from: self.answer, to: self.joke, duration: 1.0, options: .transitionFlipFromRight, completion: nil)
            })
        } else {
            knockCount += 1
            
            switch knockCount {
            case 1:
                UIView.animate(withDuration: 0.7, delay: 1.0, options: .transitionFlipFromLeft, animations: {
                print(self.joke)
                }, completion: nil)
            case 2:
                UIView.animate(withDuration: 0.7, delay: 1.0, options: .transitionFlipFromLeft, animations: {
                    //do shit
                    }, completion: nil)
            case 3:
                UIView.animate(withDuration: 0.7, delay: 1.0, options: .transitionFlipFromLeft, animations: {
                    //do shit
                    }, completion: nil)
            case 4:
                UIView.animate(withDuration: 0.7, delay: 1.0, options: .transitionFlipFromLeft, animations: {
                    //do shit
                    }, completion: nil)
//                UIView.animate(withDuration: 0.7, delay: 1.0, options: .transitionFlipFromLeft, animations: {
//                    //do shit
//                    }, completion: (_ : Bool) -> Void in {
//                        UIView.animate(withDuration: 0.7, delay: 1.0, options: .transitionFlipFromRight, animations: {
//                            //do shit
//                            }, completion: nil)
//                    })
            default:
                break
            }
        }
    }
}

