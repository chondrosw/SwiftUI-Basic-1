//
//  Game.swift
//  Basic-SwiftUI-Part1
//
//  Created by Chondro Satrio Wibowo on 15/03/22.
//

import Foundation

struct Game{
    let start = RGB()
    var target = RGB.random()
    var round = 1
    var scoreRound = 0
    var scoreTotal = 0
    
    mutating func check(guess:RGB){
        let difference = lround(guess.difference(target: target) * 100)
        scoreRound = 100 - difference
        if difference == 0{
            scoreRound += 100
        }else if difference == 1{
            scoreTotal += scoreRound
        }
    }
    
    mutating func startNewRound(){
        round += 1
        scoreRound = 0
        target = RGB.random()
    }
    
    mutating func startNewGame(){
        round = 0
        scoreTotal = 0
        startNewRound()
    }
    
}
