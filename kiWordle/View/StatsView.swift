//
//  StatsView.swift
//  kiWordle
//
//  Created by Harold Marash on 6/1/22.
//

import SwiftUI

struct StatsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView{
            VStack(spacing: 2){
                //Spacer()
                Text("Stats")
                Spacer()
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Close")
                }
                //.sheet(onDisappear())
                Spacer()
            }
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
