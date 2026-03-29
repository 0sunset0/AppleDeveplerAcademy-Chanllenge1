//
//  OnboardingCard.swift
//  challenge1
//
//  Created by 노을 on 3/28/26.
//

import SwiftUI

struct AnimalCard: View {
    var index: Int
    @Binding var selectedIndex: Int
    
    var body: some View {
        VStack{
            Image("dolphin")
            Text("해파리")
                .font(.largeTitle)

            Text("혼자만의 시간 속에서\n마음을 채워가요!")
                .font(.body)
                .multilineTextAlignment(.center)
        }
        .background(Color.white)
        .cornerRadius(24)
        .border(.main)
    }
}
