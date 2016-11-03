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
    @IBOutlet weak var dadJokeButton: UIButton!
    @IBOutlet weak var dadJokeLabel: UILabel!
    private var type = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        type = self.title!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButton(_ sender: AnyObject) {
        if type != "Dad" {
            UIView.transition(from: joke, to: answer, duration: 1.0, options: [.showHideTransitionViews, .transitionFlipFromLeft], completion: { (_ : Bool) -> Void in
                usleep(750000)
                UIView.transition(from: self.answer, to: self.joke, duration: 1.0, options: [.showHideTransitionViews, .transitionFlipFromRight], completion: nil)
            })
        } else {
            DadJoke.shared.dadCount += 1
            let count = DadJoke.shared.dadCount
            
            self.dadJokeLabel.text = ""
            UIView.transition(with: joke, duration: 1.0, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: nil, completion: {(_ : Bool) -> Void in
                    switch count {
                    case 1:
                        self.dadJokeLabel.text = DadJoke.shared.knockJokes[count]
                    case 2:
                        self.dadJokeLabel.text = DadJoke.shared.knockJokes[count]
                    case 3:
                        self.dadJokeLabel.text = DadJoke.shared.knockJokes[count]
                    case 4:
                        self.dadJokeLabel.text = DadJoke.shared.knockJokes[count]
                    case 5:
                        self.dadJokeLabel.text = DadJoke.shared.knockJokes[count]
                        self.dadJokeButton.isHidden = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                            UIView.transition(with: self.joke, duration: 1.0, options: UIViewAnimationOptions.transitionFlipFromRight, animations: nil, completion: {(_ : Bool) -> Void in
                                self.dadJokeLabel.text = DadJoke.shared.knockJokes[0]
                                self.dadJokeButton.isHidden = false
                                DadJoke.shared.dadCount = 0
                            })
                        })
                    default:
                        self.dadJokeLabel.text = DadJoke.shared.knockJokes[0]
                    }
                    
                }
            )
        }
    }
}

