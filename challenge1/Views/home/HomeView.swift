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
    @Query private var completedActivities: [CompletedActivity]

    var animal: Animal { Animal.dolphin }

    var completedCount: Int {
        completedActivities.count
    }

    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    CharacterView(imageName: animal.image(for: level))
                        .padding(.top, 8)

                    LevelBar(
                        levelName: animal.name(for: level),
                        description: animal.description(for: level),
                        progress: Level.progressRatio(completedCount: completedCount)
                    )
                    .padding(.horizontal, 20)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Today Activity")
                            .font(.dsTitle2)
                            .foregroundStyle(Color.textBody)

                        Text("추천 액티비티를 완료하고 레벨업 해보세요")
                            .font(.dsBody)
                            .foregroundStyle(Color.textBody)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(filtered) { todayChallenge in
                                    NavigationLink(value: todayChallenge) {
                                        TodayChallengeView(todayChallenge: todayChallenge)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 24)
                    .padding(.bottom, 20)
                }
            }
            .appBackground()
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(for: TodayChallenge.self) { challenge in
                ActivityDetail(
                    todayChallenge: challenge,
                    onCertified: { path = NavigationPath() }
                )
            }
        }
    }

    var filtered: [TodayChallenge] {
        todayChallenges.filter {
            Calendar.current.isDateInToday($0.date) && !$0.isCompleted
        }
    }

    var level: Level {
        Level.from(completedCount: completedCount)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: TodayChallenge.self, CompletedActivity.self, configurations: config)
    for challenge in TodayChallenge.dummies {
        container.mainContext.insert(challenge)
    }
    return HomeView()
        .modelContainer(container)
}
