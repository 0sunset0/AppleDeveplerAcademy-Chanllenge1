//
//  ActivityCalendarPicker.swift
//  challenge1
//
//  Created by 노을 on 3/29/26.
//

import SwiftUI

struct ActivityCalendarPicker: View {
    /**
     부모의 @State를 가리키는 참조. 그래서 자식 뷰에서 값을 바꾸면 부모의 @State도 같이 바뀐다.
     Binding인 이유 : DatePicker는 보여주기만 하는 게 아니라 유저가 날짜를 탭하면 $selectedDate를 통해 부모의 값을 바꾼다. 
     */
    @Binding var selectedDate: Date
    
    var body: some View {
        DatePicker(
            "Start Date",
            selection: $selectedDate,
            displayedComponents: [.date]
        )
        .datePickerStyle(.graphical)
        .padding(30)
    }
}
/**
 .constant() : 직접 변경 안되는 고정값
 */
#Preview {
    ActivityCalendarPicker(selectedDate: .constant(Date()))
}
