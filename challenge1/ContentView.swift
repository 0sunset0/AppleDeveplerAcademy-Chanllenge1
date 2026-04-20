//
//  ContentView.swift
//  challenge1
//
//  Created by 노을 on 3/26/26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("홈", systemImage: "house.fill") }
            CalendarView()
                .tabItem { Label("캘린더", systemImage: "calendar") }
        }
    }
}

#Preview {
    ContentView()
        .environment(CompletedChallengeStore())
}
