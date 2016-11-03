//
//  DadJoke.swift
//  iKid
//
//  Created by Elizabeth on 11/2/16.
//  Copyright © 2016 Elizabeth. All rights reserved.
//

final class Jokes {
    static let shared = Jokes() //lazy init, and it only runs once
    
    var goodJokes = ["What did the snail say while sitting on the turtle?"]
    
    var punJokes = ["What’s a computer’s favorite beat?", "An algo-rhythm"]
    
    var knockJokes = ["knock knock", "who's there?", "knock", "knock who?", "knock knock", "who's there...?"]
    var dadCount : Int = 0
}
