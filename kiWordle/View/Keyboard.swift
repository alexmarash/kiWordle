//
//  AlphaMatrix.swift
//  kmWordle
//
//  Created by Harold Marash on 5/11/22.
//

import SwiftUI

struct Keyboard: View {
    @EnvironmentObject var game: kWordlePlayModel
    
    var rowOneArray = "QWERTYUIOP".map{ String($0) }
    var rowTwoArray = "ASDFGHJKL".map{ String($0) }
    var rowThreeArray = "ZXCVBNM".map{ String($0) }
    
    
    var body: some View {
        VStack {
            HStack(spacing: 2){
                ForEach(rowOneArray, id: \.self) { letter in KeyboardButton(letterClass: LetterClass(letter: letter, state: .unused)) }
            }
            HStack(spacing: 2){
                    ForEach(rowTwoArray, id: \.self) { letter in KeyboardButton(letterClass: LetterClass(letter: letter, state: .unused)) }
            }
            HStack(spacing: 2){
                Button {
                    game.enterKey()
                } label: {
                    Text("Enter")
                }
                .font(.system(size: 20))
                .frame(width: 60, height: 50)
                .foregroundColor(.primary)
                .background(getColor(.unused))
                
                ForEach(rowThreeArray, id: \.self) { letter in KeyboardButton(letterClass: LetterClass(letter: letter, state: .unused)) }
                Button {
                    game.deleteKey()
                } label: {
                    //Text("Delete")
                    Image(systemName: "delete.backward.fill")
                    .font(.system(size: 20, weight: .heavy))
                    .frame(width: 60, height: 50)
                    .foregroundColor(.primary)
                    .background(getColor(.unused))
                }
                .disabled(game.currentEntry.count == 0)  //TODO this is just an example, need to add to other lines as well
                .opacity((game.currentEntry.count == 0) ? 0.6 : 1) //TODO this is just an example, need to add to other lines as well
                
            }
        }
    }
}


struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
            Keyboard()
               .environmentObject(kWordlePlayModel())
           .scaleEffect(Global.keyboardScale)
        
    }
}
