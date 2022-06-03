//
//  Guess.swift
//  kmWordle
//
//  Created by Harold Marash on 5/17/22.
//

import SwiftUI

struct Guess {
    let index: Int
    //let wordLength = 5
    var word = "     " // TODO must be the correct size - when changing to multiletter wordle, needs to initialize to the correct size

    var letterColor = [Color](repeating: getColor(LetterState.unused), count: 5)
    var letterShown = [Bool](repeating: false, count: 5)
    
    var guessLetters: [String] {
        word.map {String($0)}
        }
    
    init(index: Int){
        self.index = index
        //self.wordLength = wordLength
        var letterColor = [Color](repeating: getColor(LetterState.unused), count: 5)
        var letterShown = [Bool](repeating: false, count: 5)

    }
    



    /*
    func createGuess() {
        var word = ""
        var letterColor = [Color](repeating: .unused, count: wordLength)
        var letterShown = [Bool](repeating: false, count: wordLength)
        var guessLetters: [String] {
            word.map {String($0)}
        }
    }
     */
    
    
}
