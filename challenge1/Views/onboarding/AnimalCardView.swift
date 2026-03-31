//
//  OnboardingCard.swift
//  challenge1
//
//  Created by 노을 on 3/28/26.
//

import SwiftUI

struct AnimalCardView: View {
    var animal: Animal
    
    var body: some View {

        VStack{
            Image(animal.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(animal.name)
                .font(.largeTitle.bold())
            Text(animal.description)
                .font(.body)
                .multilineTextAlignment(.center)

            
        }
        .padding()
        .frame(width: 225, height: 328)
        
        .background(Color.white)
        
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.stroke, lineWidth: 1))
        
        .shadow(
            color: Color(.shadow).opacity(0.2),
            radius: 10,
            x: -2,
            y: 4
        )
        .shadow(
            color: Color(.shadow).opacity(0.2),
            radius: 10,
            x: 2,
            y: 0
        )
    }
}

#Preview {
    AnimalCardView(animal: Animal.all[0])
}
