//
//  ContentView.swift
//  Wordflip.Final
//
//  Created by Danika Peet on 2025-04-13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var cards: [Card] = []
    @State private var firstFlipped: Int? = nil
    @State private var score = 0
    
    var body: some View {
        
        ZStack {
            Rectangle()
            
            VStack {
                
                
                HStack {
                    Text("Score:")
                        .foregroundStyle(.white)
                    
                    Button("New Game") {
                        newGame()
                    }
                    
                }
                
                
            }
            .padding()
        }
    }
    
    func newGame() {
        let image = ["🐬","🐟","🦑","🐊"]
        let newDeck = (image + image).shuffled().map {
            Card(image: $0) }
            cards = newDeck
            firstFlipped = nil
            score = 0
        }
    }

#Preview {
    ContentView()
}
