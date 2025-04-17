//
//  CreditsView.swift
//  Wordflip.Final
//
//  Created by Danika Peet on 2025-04-15.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .fill(LinearGradient( colors: [Color.green, Color.teal, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            VStack {
                
            NavigationStack {
                NavigationLink("Return Home"){
                    StartingView()
                }
            }
           
                Text("Credits:")
                    .foregroundStyle(.white)
                    .bold()
                    .font(.largeTitle)
                
                HStack {
                    Text("Images:")
                        .foregroundStyle(.white)
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    VStack {
                        
                        Text("brgfx. (n.d.). Forest scene with various forest trees. FreePik. photograph. Retrieved April 10, 2025, from https://www.freepik.com/free-vector/forest-scene-with-various-forest-trees_15662390.htm#fromView=keyword&page=1&position=1&uuid=7e297612-6542-4975-b271-11319ee75f5a&query=A+Forest+Cartoon+Hamlet. ")
                            .foregroundStyle(.white)
                            .font(.caption2)
                        
                        Text("Cartoon Monkey PNG. (n.d.). PikBest. photograph. Retrieved April 10, 2025, from https://pikbest.com/png-images/qiantu-cartoon-monkey-png-download_2625610.html. ")
                            .foregroundStyle(.white)
                            .font(.caption2)
                    }
                }
                .padding()
                
                HStack {
                    Text("DeBugging done with help from ChatGPT:")
                        .foregroundStyle(.white)
                        .font(.title2)
                        .bold()
                    
                    Text("All code assisted by ChatGPT is listed in the comments")
                        .foregroundStyle(.white)
                        .font(.caption2)
                    
                }.padding()
                
                
                Text("App Made April 15th 2025")
                    .foregroundStyle(.white)
                    .bold()
                    .font(.title)
            }
           
        }
    }
}

#Preview {
    CreditsView()
}
