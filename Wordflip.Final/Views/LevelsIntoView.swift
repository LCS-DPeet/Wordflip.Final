//
//  LevelsIntoView.swift
//  Wordflip.Final
//
//  Created by Danika Peet on 2025-04-14.
//

import SwiftUI

struct LevelsIntoView: View {
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                Rectangle()
                    .fill(LinearGradient( colors: [Color.green, Color.teal, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                
                VStack {
                    Text("Levels:")
                        .foregroundStyle(.white)
                        .bold()
                        .font(.largeTitle)
                    
                    HStack {
                        VStack {
                            NavigationLink("Level 1"){
                                Level1View()
                            }
                            .font(.largeTitle)
                            
                            NavigationLink("Level 2"){
                                Level2View()
                            }
                            .font(.largeTitle)
                            
                            NavigationLink("Level 3"){
                                Level3View()
                            }
                            .font(.largeTitle)
                            
                            NavigationLink("Level 4"){
                                Level4View()
                            }
                            .font(.largeTitle)
                            
                            NavigationLink("Level 5"){
                                Level5View()
                            }
                            .font(.largeTitle)
                            
                        }
                        
                        VStack {
                            NavigationLink("Level 6"){
                                Level6View()
                            }
                            .font(.largeTitle)
                            
                            NavigationLink("Level 7"){
                                Level7View()
                            }
                            .font(.largeTitle)
                            
                            NavigationLink("Level 8"){
                                Level8View()
                            }
                            .font(.largeTitle)
                            
                            NavigationLink("Level 9"){
                                Level9View()
                            }
                            .font(.largeTitle)
                            
                            NavigationLink("Level 10"){
                                Level10View()
                            }
                            .font(.largeTitle)
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LevelsIntoView()
}
