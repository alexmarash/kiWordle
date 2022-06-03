//
//  SwiftUIView.swift
//  kiWordle
//
//  Created by Harold Marash on 6/1/22.
//

import SwiftUI

struct OpeningView: View {
    @EnvironmentObject var newGame: NewGameMenu
    @EnvironmentObject var game: kWordlePlayModel
    
    @State private var showSettings = false
    @State private var showStats = false
    @State private var showNewGameSelect = false
    
    var body: some View {
        NavigationView{
            VStack(spacing: 3) {
                //Spacer()
                Text("Katheryn's Wordle for iPhone")
                Spacer()
                Text("Select Player")
                Button {
                    
                } label: {
                    Text("Pull down Menu not working yet")
                }
                Spacer()
            
                HStack(spacing: 50) {
                    Button {
                        //NewGameSelectView()
                        showNewGameSelect.toggle()
                    } label: {
                        Text("New Game")
                    }
                    Button {
                        showStats.toggle()
                        //StatsView()
                    } label: {
                        Text("Stats")
                    }
                    Button {
                        showSettings.toggle()
                        //SettingsView()
                    } label: {
                        Text("Settings")
                    }
                }
                .sheet(isPresented: $showSettings){
                    SettingsView()
                }
                .sheet(isPresented: $showStats){
                    StatsView()
                }
                .sheet(isPresented: $showNewGameSelect){
                    NewGameSelectView()
                }
                Spacer()
            }
        }
        
        

    }
}

struct OpeningView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningView()
    }
}
