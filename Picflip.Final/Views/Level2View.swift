//
//  Level2View.swift
//  Wordflip.Final
//
//  Created by Danika Peet on 2025-04-14.
//

import SwiftUI

struct Level2View: View {
    @State private var cards: [Card] = []
    @State private var firstFlipped: Int? = nil
    @State private var score = 0
    @State var currentEmoji = images.randomElement()!
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(LinearGradient( colors: [Color.green, Color.teal, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            VStack {
                
                
                HStack {
                    ZStack {
                        
                        Rectangle()
                            .cornerRadius(5)
                            .foregroundStyle(.white)
                            .frame(width: 80, height: 20)
                        
                        Text("Score: \(score)")
                            .foregroundStyle(.black)
                        
                    }
                    
                    NavigationStack{
                        
                        NavigationLink("Return To Levels"){
                            LevelsIntoView()
                        }
                    }
                    
                    Spacer()
                    NavigationStack{
                        
                        NavigationLink("Next Level"){
                            Level3View()
                        }
                    }
                    
                    Button("New Game") {
                        newGame()
                    }
                    
                }
                .padding()
                
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()]) {
                    ForEach(cards.indices, id: \.self) {
                        index in let card = cards[index]
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(card.faceUp || card.matched ? Color.white : Color.cyan)
                                .frame(width: 200, height: 150)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2))
                            
                            if card.faceUp || card.matched {
                                Text(card.image)
                            }
                            
                            
                        }
                        .onTapGesture {
                            flipCard(at: index)
                        }
                        
                        .opacity(card.matched ? 0.3 : 1)
                        
                        
                    }
                    
                }
                .padding(10)
                
            }
            .onAppear{
                newGame()
            }
        }
    }
    
    func newGame() {
        let SelectedEmojis = images.shuffled().prefix(3).map { $0.emoji }
        let newDeck = (SelectedEmojis + SelectedEmojis) .shuffled().map {
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
    Level2View()
}
