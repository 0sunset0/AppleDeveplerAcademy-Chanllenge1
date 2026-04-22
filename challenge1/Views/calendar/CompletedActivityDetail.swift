//
//  CompletedActivityDetail.swift
//  challenge1
//
//  Created by 노을 on 4/21/26.
//

import SwiftUI

struct CompletedActivityDetail: View {
    let completedActivity: CompletedActivity

    var body: some View {
        VStack(spacing: 0) {

            // 상단 히어로 이미지
            ZStack(alignment: .bottomLeading) {
                Image("activity")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 280)
                    .clipped()

                LinearGradient(
                    colors: [.black.opacity(0.55), .clear],
                    startPoint: .top,
                    endPoint: .bottom
                )

                Text(completedActivity.todayChallenge.title)
                    .font(.title.bold())
                    .foregroundStyle(.white)
                    .padding()
            }
            .frame(height: 280)

            // 하단 정보 카드
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    // 위치
                    HStack(spacing: 8) {
                        Image(systemName: "mappin")
                        Text(completedActivity.todayChallenge.location)
                            .font(.subheadline)
                    }
                    .foregroundStyle(.secondary)

                    // 완료 날짜
                    Text(completedActivity.completedDate.formatted(date: .long, time: .omitted))
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    // 설명
                    Text(completedActivity.todayChallenge.summary)
                        .font(.body)
                        .foregroundStyle(.primary)

                    // 인증 사진
                    Image(completedActivity.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 268)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding()
            }
            .background(Color.white)
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    NavigationStack {
        CompletedActivityDetail(completedActivity: CompletedActivity.dummies[0])
    }
}
