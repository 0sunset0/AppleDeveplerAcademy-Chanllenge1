//
//  ActivityCard.swift
//  challenge1
//
//  Created by 노을 on 3/28/26.
//

import SwiftUI

struct ActivityCard: View {
    
    let date: String
    let title: String
    let imageName: String
    
    var body: some View {
        List{
            VStack {
                Text(date)
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                Text(title)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(22)
                    .padding(30)
            }
        }
    }
}

#Preview {
    ActivityCard(date: "25일", title: "제이슨 러닝코스 달리기", imageName: "activity")
}
