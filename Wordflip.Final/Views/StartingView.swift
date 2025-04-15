//
//  StartingView.swift
//  Wordflip.Final
//
//  Created by Danika Peet on 2025-04-13.
//

import SwiftUI

struct StartingView: View {
    var body: some View {
        NavigationStack {
            
            ZStack {
                Image("Monkey")
                
                VStack {
                    
                    Text("WordFlip")
                        .font(.system(size: 100))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    NavigationLink("Free Play") {
                        FreePlayView()
                    }
                    
                    NavigationLink("Levels"){
                        //levelsView
                    }
                    
                    NavigationLink("Practice"){
                        //practiceView
                    }
                    
                    NavigationLink("Credits") {
                        //creditView
                    }
                    
                }
                
                
            }
            
            
            
            
        }
    }
}

#Preview {
    StartingView()
}
