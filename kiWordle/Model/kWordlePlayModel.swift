//
//  kWordlePlayModel.swift
//  kiWordle
//
//  Created by Harold Marash on 6/1/22.
//

import Foundation
import SwiftUI

class kWordlePlayModel:  ObservableObject {
    @Published var guesses: [Guess] = []
    
    var testLetter = LetterClass()
    //testLetter.letter = "A"
    //testLetter.state = .hint
    var wordLength = 5
    var keyboardsColor = [String : LetterState]()
    var theAnswer = ""
    var currentTry: Int
    var currentEntry = [Character]()
    var currentGuess = [Character]()
    
    
    
    init() {
        currentTry = 0
        newGame(wordLength: wordLength)

    }
    
    func newGame(wordLength: Int){
        //create new game
        //populateDefaults()
        initializeKeyboard()
        initializeGuesses(wordLength: wordLength)
        theAnswer = "START"

    }
    
    /*
    func populateDefaults() {
        guesses = []
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
    }
     */
    
    
    func initializeKeyboard(){
        let allLetters = "QWERTYUIOPASDFGHJKLZXCVBNM"
        for letter in allLetters {
            keyboardsColor[String(letter)] = .unused
        }
        
    }
    
    func initializeGuesses(wordLength: Int){
        guesses = []
        for index in 0...wordLength {
            //guesses.append(Guess(index: index, wordLength: wordLength))
            guesses.append(Guess(index: index))
        }
        
    }
    
    func addLetterToTable(_ letter: String){
        //currentEntry.append([Character](letter))
        let thisLetter = Character(letter)
        currentEntry.append(thisLetter)
        updateGuess()
        
        /*
        
        var thisGuess: Guess
        //thisGuess = currentEntry
        
        var thisWord: String
        thisWord = ""
        
        print (currentEntry.count)
        
        for i in 0..<wordLength{
            
            if i < currentEntry.count {
                thisWord += String(currentEntry[i])
            } else {
                thisWord += " "
            }
    
            
            
            //print ("theeh", i)
            //thisWord += String(currentEntry[i])
        }
        
        //thisGuess.word = thisWord
        
        
        guesses[currentTry].word = thisWord
         */
        
    }
    
    func updateGuess() {
        //var thisGuess: Guess
        //thisGuess = currentEntry
        
        var thisWord: String
        thisWord = ""
        
        print (currentEntry.count)
        
        for i in 0..<wordLength{
            
            if i < currentEntry.count {
                thisWord += String(currentEntry[i])
            } else {
                thisWord += " "
            }
    
            
            
            //print ("theeh", i)
            //thisWord += String(currentEntry[i])
        }
        
        //thisGuess.word = thisWord
        
        
        guesses[currentTry].word = thisWord
    }
    
    
    
    func enterKey() -> Bool{
        if currentEntry.count == wordLength{
            
            print (currentEntry)
            print (isThisAWord(currentEntry))
            print (String(currentEntry))
            
            if isThisAWord(currentEntry) {

                currentGuess = currentEntry
                currentTry += 1
                
                currentEntry = []
                
                return true
            }
        }
        
        return false
        
    }
    
    func deleteKey(){
        if currentEntry.count > 0 {
            currentEntry.removeLast()
            
            print ("remvoing lsat")
            
            //guesses[currentTry].word[currentEntry.count] = " "
            updateGuess()
            
            /*
            
            guesses[currentTry].word.re
            
            guesses[currentTry].word.replaceSubrange(Range<String.Index>(start: currentEntry.count - 1 end: currentEntry.count), with: " ")
            //guesses[currentTry].word += " "
             */
        }
    }
    
    
    func isThisAWord(_ currentWord:  [Character]) -> Bool{
        UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: String(currentWord))
        //UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: String(currentWord))
        

        
    }
    
    
}

