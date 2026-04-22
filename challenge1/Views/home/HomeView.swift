//
//  HomeView.swift
//  challenge1
//
//  Created by 노을 on 3/26/26.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Query private var todayChallenges: [TodayChallenge]
    @Query var completedActivities: [CompletedActivity]
    
    var animal: Animal { Animal.dolphin }
    
    var completedCount: Int {
        completedActivities.count
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    let imageName = animal.image(for: level)
                    CharacterView(imageName: imageName)
                    
                    LevelBar(
                        levelName: animal.name(for: level),
                        description: animal.description(for: level),
                        progress: Level.progressRatio(completedCount: completedCount)
                    )
                    
                    Spacer()
                    
                    Text("Today Activity")
                        .font(.title2.bold())
                    Text("추천 액티비티를 완료하고 레벨업 해보세요")
                        
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(filtered) { todayChallenge in
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
    
    var filtered: [TodayChallenge] {
        todayChallenges.filter {
            // $0 = 배열의 각 액티비티
            Calendar.current.isDateInToday($0.date)
        }
    }
    
    var level: Level {
        Level.from(completedCount: completedCount)
    }
    
}

#Preview {
    HomeView()
}
