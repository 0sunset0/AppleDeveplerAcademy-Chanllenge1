//
//  Onboarding.swift
//  challenge1
//
//  Created by 노을 on 3/26/26.
//

import SwiftUI

struct Onboarding: View {
    @State private var selectedIndex: Int = -1
    @AppStorage("profileAnimal") private var profileAnimal = ""
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    let animals = ["dolphin", "whale", "turtle", "crab"]
    
    var body: some View {
        
        ZStack{
            Circle()
                .fill(.blue.opacity(0.1))
                .frame(width: 200, height: 200)
                .blur(radius: 50)
            
            VStack{
                Text("당신은 어떤 해양 생물인가요?")
                    .font(.title2)
            
                TabView {
                    AnimalCard(index: 1, selectedIndex: $selectedIndex)
                    AnimalCard(index: 1, selectedIndex: $selectedIndex)
                    AnimalCard(index: 1, selectedIndex: $selectedIndex)
                    AnimalCard(index: 1, selectedIndex: $selectedIndex)
                }
                .tabViewStyle(.page)
                
                Button {
                    profileAnimal = animals[selectedIndex]
                    hasSeenOnboarding = true
                } label: {
                    Text("다음")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .buttonStyle(.bordered)
                .tint(.main)
            }
        }

        
    }
}

#Preview {
    Onboarding()
}
