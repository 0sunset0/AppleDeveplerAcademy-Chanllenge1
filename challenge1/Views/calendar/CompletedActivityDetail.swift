//
//  CompletedActivityDetail.swift
//  challenge1
//
//  Created by 노을 on 4/21/26.
//

import SwiftUI
import SwiftData

struct CompletedActivityDetail: View {
    let completedActivity: CompletedActivity
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack(alignment: .top) {
                heroLayer
                cardLayer

                // Back button (Figma: glass capsule, x=23, y=63)
                HStack {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.white)
                            .frame(width: 44, height: 48)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 1000))
                    }
                    Spacer()
                }
                .padding(.leading, 23)
                .padding(.top, 63)
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
    }

    // MARK: - Hero Image

    private var heroLayer: some View {
        ZStack(alignment: .bottomLeading) {
            Image("activity")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 313)
                .clipped()

            LinearGradient(
                stops: [
                    .init(color: .black.opacity(0.55), location: 0),
                    .init(color: .black.opacity(0.2), location: 0.7),
                    .init(color: .clear, location: 1)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 313)

            Text(completedActivity.todayChallenge.title)
                .font(.dsTitle1)
                .foregroundStyle(Color.onMain)
                .lineSpacing(6)
                .tracking(0.36)
                .padding(.horizontal, 38)
                .padding(.bottom, 101)
        }
        .frame(height: 313)
    }

    // MARK: - Content Card

    private var cardLayer: some View {
        VStack(spacing: 0) {
            Color.clear.frame(height: 277)

            VStack(alignment: .leading, spacing: 0) {
                // Location (Figma: y=25)
                HStack(spacing: 8) {
                    Image(systemName: "mappin")
                        .font(.dsSubheadline)
                    Text(completedActivity.todayChallenge.location)
                        .font(.dsSubheadline)
                        .tracking(-0.24)
                }
                .foregroundStyle(Color.textBody)
                .padding(.top, 25)
                .padding(.horizontal, 36)

                // Date (Figma: y=71, Caption · 12)
                Text(completedActivity.completedDate.formatted(.dateTime
                    .year().month().day()
                    .locale(Locale(identifier: "ko_KR"))
                ))
                .font(.dsCaption)
                .foregroundStyle(Color.textSecondary)
                .padding(.top, 22)
                .padding(.horizontal, 36)

                // Description (Figma: y=109, Body · 17)
                Text(completedActivity.todayChallenge.summary)
                    .font(.dsBody)
                    .foregroundStyle(Color.textBody)
                    .lineSpacing(7)
                    .tracking(-0.41)
                    .frame(maxWidth: 327, alignment: .leading)
                    .padding(.top, 22)
                    .padding(.horizontal, 36)

                // Certification photo (Figma: y=198, 330×268, radius 12)
                Image(completedActivity.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 330, height: 268)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(maxWidth: .infinity)
                    .padding(.top, 40)
                    .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.card)
            .clipShape(UnevenRoundedRectangle(topLeadingRadius: 20, topTrailingRadius: 20))
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(
        for: TodayChallenge.self, CompletedActivity.self,
        configurations: config
    )
    let challenge = TodayChallenge.dummies[0]
    container.mainContext.insert(challenge)
    let activity = CompletedActivity(
        completedDate: Date(),
        imageName: "activity",
        todayChallenge: challenge
    )
    container.mainContext.insert(activity)
    return NavigationStack {
        CompletedActivityDetail(completedActivity: activity)
    }
    .modelContainer(container)
}
