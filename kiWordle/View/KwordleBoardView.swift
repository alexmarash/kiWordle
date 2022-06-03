//
//  KwordleBoard.swift
//  kmWordle
//
//  Created by Harold Marash on 5/16/22.
//

import SwiftUI

struct KwordleBoardView: View {
    @EnvironmentObject var game: kWordlePlayModel  //TODO THIS IS WRONG
    //YourView().environmentObject(yourEnvironmentObject)
    
    //view.environmentObject(dm)
    

    
    let tries = 5
    
    var body: some View {
        
        //dm.environmentObject(dm)
        
        NavigationView {
            VStack {
                VStack(spacing: 3) {
                    
                    ForEach(0...5, id: \.self) { index in
                        GuessView(guess: $game.guesses[index])
                    }
                    
                    
                    //ForEach index in indexies{
                    //ForEach((0...tries), id: \.self) {
                    //    GuessView(guess: $dm.guesses[($0)])
                    
                    //GuessView(guess: $dm.guesses[index])
                    //GuessView(guess: $dm.guesses[1])
                    //GuessView(guess: $dm.guesses[2])
                    //GuessView(guess: $dm.guesses[3])
                    //GuessView(guess: $dm.guesses[4])
                    //GuessView(guess: $dm.guesses[5])
                    //}
                
                }.frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 5)

                Spacer()
                Keyboard()
                    .scaleEffect(Global.keyboardScale)
                    .padding(.top)
                Spacer()
                
            }.navigationBarTitleDisplayMode(.inline)
                .overlay(alignment: .top) {
                    if let popUpText = game.popUpText {
                        PopUpView(popUpText: popUpText)
                            .offset(y: 20)
                    }
                }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                        
                    } label: {
                        Image(systemName: "chart.bar.fill")
                    }
                }
                ToolbarItem(placement: .principal) {
                    Button {
                        
                        
                    } label: {
                        Text("New Game")
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                        
                    } label: {
                        Image(systemName: "gearshape.fill")
                    }

                }
            }

        }.navigationViewStyle(.stack)
    }
}

struct KwordleBoard_Previews: PreviewProvider {

    static var previews: some View {
        KwordleBoardView()
            .environmentObject(kWordlePlayModel())
    }
}
