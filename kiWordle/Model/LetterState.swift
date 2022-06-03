//
//  LetterState.swift
//  kmWordle
//
//  Created by Harold Marash on 5/6/22.
//

import Foundation
import SwiftUI

enum LetterState {
    case correct  // correct letter
    case hint  // this is used as a hint
    case wrong // used not correct
    case unused // not used yet
}

func getColor (_ state: LetterState) -> (Color) {
    switch state {
    case .wrong:
        return Color(.systemGray2)
    case .hint:
        return Color(.systemYellow)
    case .correct:
        return Color(.systemGreen)
    case .unused:
        return Color(white: 1.0)
    }
}

func getFontColor (_ state: LetterState) -> (Color) {
    switch state {
    case .wrong:
        return Color(white: 1.0)
    case .hint:
        return Color(white: 1.0)
    case .correct:
        return Color(white: 1.0)
    case .unused:
        return Color.black
    }
}
