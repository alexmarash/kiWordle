//
//  NewGameSelectView.swift
//  kiWordle
//
//  Created by Harold Marash on 6/1/22.
//

import SwiftUI

struct NewGameSelectView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var startFiveLetterGame = false
    
    var body: some View {
        NavigationView{
            VStack(spacing: 2){
                //Spacer()
                Text("New Games")
                Spacer()
                Button {
                    startFiveLetterGame.toggle()
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Five Letter Game")
                }
                Spacer()
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Six Letter Game")
                }
                Spacer()
                
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Close")
                }

                Spacer()
                }
            .sheet(isPresented: $startFiveLetterGame){
                KwordleBoardView()
            }
        }
    }
}

struct NewGameSelectView_Previews: PreviewProvider {
    static var previews: some View {
        NewGameSelectView()
    }
}
