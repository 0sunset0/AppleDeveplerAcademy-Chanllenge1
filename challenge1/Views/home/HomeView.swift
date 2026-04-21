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
            ScrollView {
                VStack {
                    ZStack{
                        CharacterView()
                    }
                    LevelBar()
                    
                    Text("Today Activity")
                        .font(.title2.bold())
                        
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(Challenge.dummies) { challenge in
                                NavigationLink(destination: ActivityDetail(challenge: challenge)) {
                                    TodayChallengeView(challenge: challenge)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal)
                    }
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
