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
                }
                TodayActivityView()
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        print("캘린더 뷰 보기")
                    } label: {
                        Text("캘린더 > ")
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
