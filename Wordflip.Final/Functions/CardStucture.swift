//
//  CardStucture.swift
//  Wordflip.Final
//
//  Created by Danika Peet on 2025-04-13.
//

import Foundation

struct Card: Identifiable {
    let id = UUID()
    let image: String
    var faceUp: Bool = false
    var matched: Bool = false
    
}
