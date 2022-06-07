//
//  KeyboardButton.swift
//  kmWordle
//
//  Created by Harold Marash on 5/11/22.
//

import SwiftUI
import Foundation

struct KeyboardButton: View {
    @EnvironmentObject var game: kWordlePlayModel //Add game play model name here
     
    var letterClass: LetterClass
    
    //@Published var modi: LetterClass
    
    //previewLetter.letter = "C "
    //previewLetter.state = .hint
    
    
    //letterClass.state = .hint
    
    var body: some View {
        Button{
            game.addLetterToTable(letterClass.letter)  //TODO add to game plae
        } label: {
            Text(letterClass.letter)
                .font(.system(size: 20))
                .frame(width: 35, height: 50)
                .background(game.keyboardsColor[letterClass.letter])
                //.background(getColor(letterClass.state))
                .foregroundColor(getFontColor(letterClass.state))
        }
        .buttonStyle(.plain) //TODO see what happens when this is removed
    }
    
    
    
}

struct KeyboardButton_Previews: PreviewProvider {
    //var previewLetter = LetterClass(letter: "A", state: .hint )
    //var previewLetter: LetterClass
    //previewLetter.letter = "C "
    //previewLetter.state = .hint
    
    static var previews: some View {

        KeyboardButton(letterClass: LetterClass(letter: "B", state: .wrong ))
            .environmentObject(kWordlePlayModel())
        //KeyboardButton(letter: "A", state: .hint)
    }
}
