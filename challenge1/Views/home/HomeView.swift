//
//  HomeView.swift
//  challenge1
//
//  Created by 노을 on 3/26/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            VStack {
                ZStack{
                    GlowCircle()
                    CharacterView()
                    StickerView(imageName: "sandcastle", initialX: -110, initialY: 50)
                    StickerView(imageName: "smallStarfish", initialX: 140, initialY: 0)
                    StickerView(imageName: "shellfish", initialX: 0, initialY: -190)
                }
                TodayActivityView()
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    NavigationLink {
                        CalendarView()
                    } label: {
                        Label("캘린더", systemImage: "calendar")
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
