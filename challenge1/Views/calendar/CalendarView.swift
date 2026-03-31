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
     더미 데이터
     */
    let activities: [CompletedActivity] = [
        CompletedActivity(
            completedDate: Calendar.current.date(from: DateComponents(year: 2026, month: 3, day: 29))!,
            imageName: "activity",
            challenge: Challenge(date: Calendar.current.date(from: DateComponents(year: 2026, month: 3, day: 29))!, title: "포항 운하 달리기")
        ),
        CompletedActivity(
            completedDate: Calendar.current.date(from: DateComponents(year: 2026, month: 3, day: 25))!,
            imageName: "activity",
            challenge: Challenge(date: Calendar.current.date(from: DateComponents(year: 2026, month: 3, day: 25))!, title: "영일대 해수욕장 걷기")
        )
    ]

    var filtered: [CompletedActivity] {
        activities.filter {
            // $0 = 배열의 각 액티비티
            // completedDate가 selectedDate와 같은 날인지 확인
            Calendar.current.isDate($0.completedDate, inSameDayAs: selectedDate)
        }
    }
    
    var body: some View {
        VStack{
            //캘린더
            ActivityCalendarPicker(selectedDate: $selectedDate)
            
            //카드
            List{
                ForEach(filtered) { completedActivity in
                    ActivityDetailCard(completedActivity: completedActivity)
                }
            }
        }
    }
}

#Preview {
    CalendarView()
}
