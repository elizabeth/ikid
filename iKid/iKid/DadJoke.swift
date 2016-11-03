//
//  DadJoke.swift
//  iKid
//
//  Created by Elizabeth on 11/2/16.
//  Copyright © 2016 Elizabeth. All rights reserved.
//

final class DadJoke {
    static let shared = DadJoke() //lazy init, and it only runs once
    
    var knockJokes = ["knock knock", "who's there?", "knock", "knock who?", "knock knock", "who's there...?"]
    var dadCount : Int = 0
}
