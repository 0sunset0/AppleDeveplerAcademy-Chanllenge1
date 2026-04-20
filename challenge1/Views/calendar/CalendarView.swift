//
//  CalendarView.swift
//  challenge1
//
//  Created by 노을 on 3/26/26.
//

import SwiftUI

struct CalendarView: View {
    /**
     선택한 날짜를 이 뷰 안에서만 쓴다면 → @State 맞
     부모 뷰(HomeView 등)에서 날짜를 제어하거나 공유해야 한다면 → @Binding
     */
    @State private var selectedDate = Date()
    /**
     let이 아니라 var인 이유
     let은 선언할 때 값이 고정되는데, @Environment는 뷰가 생성된 후 SwiftUI가 값을 넣어준다.
     */
    @Environment(CompletedChallengeStore.self) private var store
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                calendarPicker
                activityList
            }
            .padding(.vertical)
        }
        .background(Color(.systemBlue).opacity(0.05))
    }
    
    private var calendarPicker: some View {
        ActivityCalendarPicker(selectedDate: $selectedDate)
    }
    
    private var activityList: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Activity")
                .font(.title2.bold())
                .padding(.horizontal)

            ForEach(filtered) { completedActivity in
                ActivityDetailCard(completedActivity: completedActivity)
                    .padding(.horizontal)
            }
        }
    }

    var filtered: [CompletedActivity] {
        store.completedActivities.filter {
            // $0 = 배열의 각 액티비티
            // completedDate가 selectedDate와 같은 날인지 확인
            Calendar.current.isDate($0.completedDate, inSameDayAs: selectedDate)
        }
    }
}

#Preview {
    CalendarView()
        .environment(CompletedChallengeStore())
}
