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
                            flipCard(at: index)
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
    
    func flipCard(at index: Int){
        guard !cards[index].faceUp, !cards[index].matched else { return }
        cards[index].faceUp = true
        
        if let firstIndex = firstFlipped {
            if cards[firstIndex].image == cards[index].image {
                cards[firstIndex].matched = true
                cards[index].matched = true
                score += 1
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    cards[firstIndex].faceUp = false
                    cards[index].faceUp = false
                }
            }
            firstFlipped = nil
        } else {
            firstFlipped = index
        }
      }
    }

#Preview {
    ContentView()
}
