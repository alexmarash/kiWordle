//
//  PopUpView.swift
//  kiWordle
//
//  Created by Harold Marash on 6/3/22.
//

import SwiftUI

struct PopUpView: View {
    
    let popUpText: String
    
    var body: some View {
        Text(popUpText)
            .foregroundColor(.accentColor)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.primary))
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView(popUpText: "wrong!")
    }
}
