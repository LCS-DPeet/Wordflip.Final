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
                .fill(Color.orange)
                .ignoresSafeArea()
            
            VStack {
                
                
                HStack {
                    Text("Score:")
                        .foregroundStyle(.white)
                    
                    Button("New Game") {
                        newGame()
                    }
                }
                
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()]) {
                    ForEach(cards.indices, id: \.self) {
                        index in let card = cards[index]
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(card.faceUp || card.matched ? Color.white : Color.orange)
                                .frame(height: 80)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2))
                            
                            if card.faceUp || card.matched {
                                Text(card.image)
                            }
                            
                            
                        }
                        .onTapGesture {
                        // flip card code
                        }
                        
                        
                        
                    }
                }
                
                
            }
            .onAppear{
                newGame()
            }
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
