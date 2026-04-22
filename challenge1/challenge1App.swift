//
//  challenge1App.swift
//  challenge1
//
//  Created by 노을 on 3/26/26.
//

import SwiftUI
import SwiftData

@main
struct challenge1App: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [TodayChallenge.self, CompletedActivity.self]) { result in
            guard let container = try? result.get() else { return }
            let context = container.mainContext

            let calendar = Calendar.current
            let start = calendar.startOfDay(for: .now)
            let end = calendar.date(byAdding: .day, value: 1, to: start)!
            let predicate = #Predicate<TodayChallenge> { $0.date >= start && $0.date < end }
            let todayCount = (try? context.fetchCount(FetchDescriptor(predicate: predicate))) ?? 0
            guard todayCount == 0 else { return }

            for challenge in TodayChallenge.dummies {
                context.insert(challenge)
            }
        }
    }
}
