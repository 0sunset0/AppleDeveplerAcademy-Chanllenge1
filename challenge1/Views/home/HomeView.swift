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
                            ForEach(TodayChallenge.dummies) { todayChallenge in
                                NavigationLink(destination: ActivityDetail(todayChallenge: todayChallenge)) {
                                    TodayChallengeView(todayChallenge: todayChallenge)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    HomeView()
        .environment(CompletedChallengeStore())
}
