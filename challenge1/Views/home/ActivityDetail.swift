//
//  ActivityDetail.swift
//  challenge1
//
//  Created by 노을 on 4/20/26.
//

import SwiftUI
import SwiftData

struct ActivityDetail: View {
    let todayChallenge: TodayChallenge
    let onCertified: () -> Void

    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack(alignment: .top) {
                heroLayer
                cardLayer
            }
        }
        .ignoresSafeArea(edges: .top)
        .safeAreaInset(edge: .bottom, spacing: 0) {
            NavigationLink(destination: ActivityCertificationView(todayChallenge: todayChallenge, onCertified: onCertified)) {
                Text("인증하기")
                    .font(.dsHeadline)
                    .foregroundStyle(Color.onMain)
                    .frame(maxWidth: .infinity)
                    .frame(height: 58)
                    .background(Color.main)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white.opacity(0.7), lineWidth: 1)
                    )
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 16)
            .background(Color.white)
        }
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

            Text(todayChallenge.title)
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
                // Location (Figma: y=34)
                HStack(spacing: 8) {
                    Image(systemName: "mappin")
                        .font(.dsSubheadline)
                    Text(todayChallenge.location)
                        .font(.dsSubheadline)
                        .tracking(-0.24)
                }
                .foregroundStyle(Color.textBody)
                .padding(.top, 34)
                .padding(.horizontal, 45)

                // Tags (Figma: y=84, gap=26)
                if !todayChallenge.tags.isEmpty {
                    HStack(spacing: 10) {
                        ForEach(todayChallenge.tags, id: \.self) { tag in
                            Text(tag)
                                .font(.dsSubheadline)
                                .foregroundStyle(Color.main)
                                .tracking(-0.24)
                                .padding(.horizontal, 15)
                                .frame(height: 37)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 11)
                                        .stroke(Color.main, lineWidth: 1)
                                )
                        }
                    }
                    .padding(.top, 26)
                    .padding(.horizontal, 45)
                }

                // Description (Figma: y=173, gap=52)
                Text(todayChallenge.summary)
                    .font(.dsBody)
                    .foregroundStyle(Color.textBody)
                    .lineSpacing(7)
                    .tracking(-0.41)
                    .padding(.top, 52)
                    .padding(.horizontal, 45)
                    .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.card)
            .clipShape(UnevenRoundedRectangle(topLeadingRadius: 20, topTrailingRadius: 20))
        }
    }
}

#Preview {
    NavigationStack {
        ActivityDetail(todayChallenge: TodayChallenge.dummies[0], onCertified: {})
    }
}
