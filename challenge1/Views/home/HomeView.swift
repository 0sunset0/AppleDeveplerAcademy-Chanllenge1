//
//  HomeView.swift
//  challenge1
//
//  Created by 노을 on 3/26/26.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationStack{
            VStack {
                ZStack{
                    CharacterView()
                }
                
                LevelBar()
                
                Text("Today Activity")
                    .font(.title2.bold())
                    
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        TodayChallengeView()
                        TodayChallengeView()
                    }
                    .padding(.horizontal)
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
        .environment(CompletedChallengeStore())
}
