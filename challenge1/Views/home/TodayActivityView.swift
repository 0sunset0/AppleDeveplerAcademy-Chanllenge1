//
//  TodayActivityView.swift
//  challenge1
//
//  Created by 노을 on 3/28/26.
//

import SwiftUI

struct TodayActivityView: View {
    var body: some View {
        VStack{
            Text("오늘은 제이슨의 러닝코스 달려보세요~!")
                .font(.title2)
                .bold()
            Text("벌써 40명이나 참여했어요!")
                .foregroundStyle(.main)
            
            Button {
               print("인증하기")
            } label: {
                Text("인증하기")
                    .padding()
            }
            .buttonStyle(.bordered)
            .tint(.main)
        }
    }
}

#Preview {
    TodayActivityView()
}
