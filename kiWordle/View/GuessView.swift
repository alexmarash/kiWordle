//
//  GuessView.swift
//  kmWordle
//
//  Created by Harold Marash on 5/17/22.
//

import SwiftUI

struct GuessView: View {
    @Binding var guess: Guess
    
    
    
    //var wordLength: Int
    
    var body: some View {
        HStack(spacing: 3) {
            ForEach(0...4, id: \.self ) {index in
                Text(guess.guessLetters[index])
                    .foregroundColor(.primary)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,  maxHeight: .infinity, alignment: .center)
                    .background(guess.letterColor[index])
                    .font(.system(size: 35, weight: .heavy))
                    .border(Color(.secondaryLabel))
            }
        }
    }
    
    //func printGuess(){
    //    print ("Guessview", guess)
    //}
    


}



struct GuessView_Previews: PreviewProvider {

    static var previews: some View {
        GuessView(guess: .constant(Guess(index: 0)))
    }
}
