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
    @Published var popUpText: String?

    
    var testLetter = LetterClass()
    //testLetter.letter = "A"
    //testLetter.state = .hint
    var wordLength = 5
    var keyboardsColor = [String: Color]()
    var theAnswer = ""
    var currentTry: Int
    var currentEntry = [Character]()
    var currentGuess = [Character]()
    var currentColors = [Color]()
    var answerCheck = [Character]()
    var hintList = [Character]()
    var hintCheck = [Character]()
    var answerIsCorrect = false
    var hardMode = true
    //var keyboardColor = Keyboard()
    
    
    
    
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
        createAnswerCheck()
        answerIsCorrect = false
        hardMode = true

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
    
    func createAnswerCheck(){
        answerCheck = [Character]()
        for i in 0..<wordLength{
            let thisIndex = theAnswer.index(theAnswer.startIndex, offsetBy: i)
            answerCheck.append(theAnswer[thisIndex])
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
        
        print ("update guess", guesses[currentTry])
        
    }
    
    
    func updateKeyboard(){
        for k in 0..<wordLength{
            if keyboardsColor[String(currentGuess[k])] != Color.correct{
                keyboardsColor[String(currentGuess[k])] = currentColors[k]
            }
        }
    }
    
    
    func enterKey(){
        if currentEntry.count != wordLength{
            showPopUp(with: "Not enough letters")
            return
        }
        
        print ("this is the current Entry", currentEntry)
        
        if !isThisAWord(currentEntry) {
            showPopUp(with: "That is not a word!")
            return
        }
        
        if hardMode && !checkHints(){
            showPopUp(with: "You did not use all the hints")
            return
        }
        
        answerIsCorrect = checkWord()
        currentTry += 1
        currentEntry = [Character]()
        
        if answerIsCorrect {
            showPopUp(with: "You Won!! \n You are the Champion!")
        }
       
    }
        
    
    
    func checkHints() -> Bool{
        var usedAllHints = true
        var currentEntryCopy = [Character]()
        
    

        
        for k in 0..<wordLength{
            currentEntryCopy.append(currentEntry[k])
        }
        

        for i in 0..<hintList.count{
            var usedThisHint = false
            for j in 0..<wordLength{
                if hintList[i] == currentEntryCopy[j] {
                    usedThisHint = true
                    currentEntryCopy[j] = "<"
                }
            }
            if !usedThisHint {
                usedAllHints = false
            }
        }
        return usedAllHints
    }
    
    
    
    func checkWord() -> Bool{
        currentColors = [Color](repeating: Color.wrong, count: wordLength)
        hintList = [Character]()
        
        var thisAnswerCheck = [Character]()
        var thisEntryCheck = [Character]()
        
        for k in 0..<wordLength{
            thisAnswerCheck.append(answerCheck[k])
            thisEntryCheck.append(currentEntry[k])
        }
        
    
        var correct = true
        
        
        for i in 0..<wordLength{
            guesses[currentTry].letterColor[i] = Color.wrong
            
            if thisEntryCheck[i] == thisAnswerCheck[i] {
                currentColors[i] = Color.correct
                guesses[currentTry].letterColor[i] = Color.correct
                hintList.append(currentEntry[i])
                thisAnswerCheck[i] = "<"
                thisEntryCheck[i] = ">"
            } else {
                correct = false
            }
        }
        
        if correct {
            return correct
        } else {
            for i in 0..<wordLength{
                for j in 0..<wordLength{
                    if thisEntryCheck[i] == thisAnswerCheck[j]{
                        hintList.append(currentEntry[i])
                        currentColors[i] = Color.hint
                        guesses[currentTry].letterColor[i] = Color.hint
                        thisAnswerCheck[j] = "<"
                        thisEntryCheck[i] = ">"
                    }
                }
            }
        }
        
        updateGuess()
        
        return correct
        
    }
    
    
    
    func showPopUp(with text: String?) {
        withAnimation {
            
            print ("showngin popup")
            
            popUpText = text
        }
        withAnimation(Animation.linear(duration: 0.2).delay(3)) {
            popUpText = nil
        }
    }
    //}
    
    
    func deleteKey(){
        if currentEntry.count > 0 {
            currentEntry.removeLast()

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
        
        let thisWord = String(currentWord)

        
        //TODO:  need to fix dictionary check
        
        if (UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: thisWord) == nil){
            showPopUp(with: "Please load a dictionary")
            return false}
        
        
        return UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: String(thisWord))
        //UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: String(currentWord))
        

        
    }
    
    
}

