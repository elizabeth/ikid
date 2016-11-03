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
        print(type)
        if type != "Dad" {
            UIView.transition(from: joke, to: answer, duration: 1.0, options: .transitionFlipFromLeft, completion: { (_ : Bool) -> Void in
                usleep(750000)
                UIView.transition(from: self.answer, to: self.joke, duration: 1.0, options: .transitionFlipFromRight, completion: nil)
            })
        } else {
            knockCount += 1
            
            switch knockCount {
            case 1:
                UIView.transition(from: joke, to: answer, duration: 1.0, options: .transitionFlipFromLeft, completion: nil)
            case 2:
                UIView.transition(from: answer, to: joke, duration: 1.0, options: .transitionFlipFromLeft, completion: { (_ : Bool) -> Void in
                    let jokeLabel = self.joke.viewWithTag(5) as! UILabel
                    jokeLabel.text = self.knockJokes[self.knockCount]
                })
            case 3:
                UIView.transition(from: joke, to: answer, duration: 1.0, options: .transitionFlipFromLeft, completion: { (_ : Bool) -> Void in
                    let jokeAnswerLabel = self.joke.viewWithTag(7) as! UILabel
                    jokeAnswerLabel.text = self.knockJokes[self.knockCount]
                })
            case 4:
                UIView.transition(from: answer, to: joke, duration: 1.0, options: .transitionFlipFromLeft, completion: { (_ : Bool) -> Void in
                    let jokeLabel = self.joke.viewWithTag(5) as! UILabel
                    jokeLabel.text = self.knockJokes[self.knockCount]
                    let nextButton = self.joke.viewWithTag(6) as! UIButton
                    nextButton.isHidden = true
                })
                    
                
            default:
                break
            }
        }
    }
}

