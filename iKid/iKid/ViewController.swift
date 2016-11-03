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
    @IBOutlet weak var goodJokeButton: UIButton!
    @IBOutlet weak var goodJokeLabel: UILabel!
    @IBOutlet weak var goodJokeImage: UIImageView!
    @IBOutlet weak var punJokeButton: UIButton!
    @IBOutlet weak var punJokeLabel: UILabel!
    @IBOutlet weak var dadJokeButton: UIButton!
    @IBOutlet weak var dadJokeLabel: UILabel!
    private var type = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        type = self.title!
        if self.goodJokeImage != nil {
            self.goodJokeImage.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButton(_ sender: AnyObject) {
        if type == "Good" {
            self.goodJokeLabel.text = ""
            self.goodJokeButton.isHidden = true
            UIView.transition(with: joke, duration: 1.0, options: UIViewAnimationOptions.transitionFlipFromRight, animations: nil, completion: {(_ : Bool) -> Void in
                self.goodJokeImage.isHidden = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    self.goodJokeImage.isHidden = true
                    UIView.transition(with: self.joke, duration: 1.0, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: nil, completion: {(_ : Bool) -> Void in
                        self.goodJokeLabel.text = Jokes.shared.goodJokes[0]
                        self.goodJokeButton.isHidden = false
                    })
                })
            })
        } else if type == "Pun" {
            let punJokes = Jokes.shared.punJokes
            
            self.punJokeLabel.text = ""
            self.punJokeButton.isHidden = true
            UIView.transition(with: joke, duration: 1.0, options: UIViewAnimationOptions.transitionFlipFromRight, animations: nil, completion: {(_ : Bool) -> Void in
                self.punJokeLabel.text = punJokes[1]
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    self.punJokeLabel.text = ""
                    UIView.transition(with: self.joke, duration: 1.0, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: nil, completion: {(_ : Bool) -> Void in
                        self.punJokeLabel.text = punJokes[0]
                        self.punJokeButton.isHidden = false
                    })
                })
            })
        } else if type == "Dad" {
            Jokes.shared.dadCount += 1
            let count = Jokes.shared.dadCount
            let knockJokes = Jokes.shared.knockJokes
            
            self.dadJokeLabel.text = ""
            UIView.transition(with: joke, duration: 1.0, options: UIViewAnimationOptions.transitionFlipFromRight, animations: nil, completion: {(_ : Bool) -> Void in
                    switch count {
                    case 1:
                        self.dadJokeLabel.text = knockJokes[count]
                    case 2:
                        self.dadJokeLabel.text = knockJokes[count]
                    case 3:
                        self.dadJokeLabel.text = knockJokes[count]
                    case 4:
                        self.dadJokeLabel.text = knockJokes[count]
                    case 5:
                        self.dadJokeButton.isHidden = true
                        self.dadJokeLabel.text = knockJokes[count]
                        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                            self.dadJokeLabel.text=""
                            UIView.transition(with: self.joke, duration: 1.0, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: nil, completion: {(_ : Bool) -> Void in
                                self.dadJokeLabel.text = knockJokes[0]
                                self.dadJokeButton.isHidden = false
                                Jokes.shared.dadCount = 0
                            })
                        })
                    default:
                        self.dadJokeLabel.text = knockJokes[0]
                    }
                    
                }
            )
        }
    }
}

