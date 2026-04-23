//
//  CalendarView.swift
//  challenge1
//
//  Created by 노을 on 3/26/26.
//

import SwiftUI
import SwiftData

struct CalendarView: View {
    @State private var selectedDate = Date()
    @Query private var completedActivities: [CompletedActivity]

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    // Year (Figma: Large Title · 34)
                    Text(selectedDate.formatted(.dateTime
                        .year()
                        .locale(Locale(identifier: "en_US"))
                    ))
                    .font(.dsLargeTitle)
                    .foregroundStyle(Color.textBody)
                    .tracking(0.37)
                    .padding(.top, 28)

                    // Month (Figma: Title 1 · 28)
                    Text(selectedDate.formatted(.dateTime
                        .month(.wide)
                        .locale(Locale(identifier: "en_US"))
                    ))
                    .font(.dsTitle1)
                    .foregroundStyle(Color.textBody)
                    .tracking(0.36)
                    .padding(.top, 12)

                    // Calendar glassmorphism card
                    ActivityCalendarPicker(selectedDate: $selectedDate)
                        .background(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 13))
                        .shadow(color: .black.opacity(0.1), radius: 60, x: 0, y: 10)
                        .padding(.horizontal, 25)
                        .padding(.top, 34)

                    // Activity section (Figma: Title 2 · 22)
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Activity")
                            .font(.dsTitle2)
                            .foregroundStyle(Color.textBody)
                            .tracking(0.35)

                        ForEach(filtered) { completedActivity in
                            NavigationLink(destination: CompletedActivityDetail(completedActivity: completedActivity)) {
                                ActivityCard(completedActivity: completedActivity)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 28)
                    .padding(.top, 49)
                    .padding(.bottom, 20)
                }
            }
            .appBackground()
            .toolbar(.hidden, for: .navigationBar)
        }
    }

    var filtered: [CompletedActivity] {
        completedActivities.filter {
            Calendar.current.isDate($0.completedDate, inSameDayAs: selectedDate)
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(
        for: TodayChallenge.self, CompletedActivity.self,
        configurations: config
    )
    for activity in CompletedActivity.dummies {
        container.mainContext.insert(activity)
    }
    return CalendarView()
        .modelContainer(container)
}
