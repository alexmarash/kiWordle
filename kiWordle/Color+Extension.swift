//
//  Color+Extension.swift
//  kiWordle
//
//  Created by Harold Marash on 6/6/22.
//

import SwiftUI

extension Color {
    static var wrong: Color {
        Color(UIColor(named: "Wrong")!)
    }
    
    static var hint: Color {
        Color(UIColor(named: "Hint")!)
    }
    
    static var unused: Color {
        Color(UIColor(named: "UnusedLetter")!)
    }
    
    static var correct: Color {
        Color(UIColor(named: "Correct")!)
    }
}
