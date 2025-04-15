//
//  ContentView.swift
//  Wordflip.Final
//
//  Created by Danika Peet on 2025-04-13.
//

import SwiftUI

struct FreePlayView: View {
    
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
                    
                    Spacer()
                    
                    NavigationStack{
                        
                        NavigationLink("Return Home"){
                            StartingView()
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
        //pick 6 of the potential emojis and shuffle them
        let SelectedEmojis = images.shuffled().prefix(6).map { $0.emoji }
        // Duplicates the card for matches and shuffles them
        let newDeck = (SelectedEmojis + SelectedEmojis) .shuffled().map {
            Card(image: $0) }
        //Sets cards to this created deck
            cards = newDeck
        //clears first flip as you start with no flipped cards
            firstFlipped = nil
        //sets starting score to zero
            score = 0
        }
    
    //Takes an idex of a card in the array
    func flipCard(at index: Int){
        // Checks if the card is already facedown or face up
        guard !cards[index].faceUp, !cards[index].matched else { return }
        //Flips the selected card face up
        cards[index].faceUp = true
        
        //checks for a card already flipped up before
        if let firstIndex = firstFlipped {
            //If the images match on the cards mark as matched + score
            if cards[firstIndex].image == cards[index].image {
                cards[firstIndex].matched = true
                cards[index].matched = true
                score += 1
                
                //If they dont match, wait .7 secods and flip down again
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    cards[firstIndex].faceUp = false
                    cards[index].faceUp = false
                }
            }
            
            //clear the first flip when done with the pair
            firstFlipped = nil
            //if no card was flipped prior then store card until 2nd is flipped
        } else {
            firstFlipped = index
        }
      }
    }

#Preview {
    FreePlayView()
}
