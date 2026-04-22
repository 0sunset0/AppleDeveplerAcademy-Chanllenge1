//
//  ActivityDetail.swift
//  challenge1
//
//  Created by 노을 on 4/20/26.
//

import SwiftUI

struct ActivityDetail: View {
    let todayChallenge: TodayChallenge
    var onComplete: (() -> Void)? = nil
    
    @State private var showCertification = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack(alignment: .top) {
                heroLayer
                cardLayer
            }
        }
        .ignoresSafeArea(edges: .top)
        .safeAreaInset(edge: .bottom, spacing: 0) {
            NavigationLink(destination: ActivityCertificationView(todayChallenge: todayChallenge)) {
                Text("인증")
                    .frame(maxWidth: .infinity, maxHeight: 50)
             }
            .buttonStyle(.bordered)
            .tint(.main)
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
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(.white)
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
                // Location
                HStack(spacing: 8) {
                    Image(systemName: "mappin")
                        .font(.system(size: 15))
                    Text(todayChallenge.location)
                        .font(.system(size: 15))
                        .tracking(-0.24)
                }
                .foregroundStyle(Color(white: 0.125))
                .padding(.top, 34)
                .padding(.horizontal, 45)

                // Tags
                if !todayChallenge.tags.isEmpty {
                    HStack(spacing: 10) {
                        ForEach(todayChallenge.tags, id: \.self) { tag in
                            Text(tag)
                                .font(.system(size: 15))
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
                    .padding(.top, 14)
                    .padding(.horizontal, 45)
                }

                // Description
                Text(todayChallenge.summary)
                    .font(.system(size: 17))
                    .foregroundStyle(Color(white: 0.125))
                    .lineSpacing(7)
                    .tracking(-0.41)
                    .padding(.top, 24)
                    .padding(.horizontal, 45)
                    .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .clipShape(UnevenRoundedRectangle(topLeadingRadius: 20, topTrailingRadius: 20))
        }
    }

    // MARK: - Certify Button

    private var certifyButton: some View {
        Button {
            showCertification = true
        } label: {
            Text("인증")
                .frame(maxWidth: .infinity, maxHeight: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .buttonStyle(.bordered)
        .tint(.main)
    }

    // MARK: - Back Button

    private var backButton: some View {
        Button(action: { dismiss() }) {
            Image(systemName: "chevron.left")
                .font(.system(size: 17, weight: .medium))
                .foregroundStyle(.primary)
                .frame(width: 44, height: 48)
                .background(.ultraThinMaterial, in: Capsule())
        }
    }
}

#Preview {
    NavigationStack {
        ActivityDetail(todayChallenge: TodayChallenge.dummies[0])
    }
}
