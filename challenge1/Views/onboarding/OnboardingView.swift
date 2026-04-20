//
//  Onboarding.swift
//  challenge1
//
//  Created by 노을 on 3/26/26.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selection: Int = 0
    @State private var scrolledID: ScrollPosition = .init(idType: Animal.ID.self)
    
    /**
     근데 @AppStorage는 UserDefaults를 통해 공유되기 때문에 private이지만 뷰 외부에서 접근할 수 있다 .
       OnboardingView의 profileAnimal  →  UserDefaults["profileAnimal"]
       CharacterView의 profileAnimal   →  UserDefaults["profileAnimal"]
     */
    @AppStorage("profileAnimal") private var profileAnimal: String?
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    var body: some View {
        ZStack{
            VStack(){
                Text(Strings.onboardingTitle)
                    .font(.title.bold())
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 70) {
                        Spacer()
                        ForEach(Animal.all) { animal in
                            AnimalCardView(animal: animal)
                        }
                        Spacer()
                    }
                    .scrollTargetLayout()
                }
                .frame(maxWidth: .infinity, maxHeight: 500)
                .scrollTargetBehavior(.viewAligned)
                .scrollPosition($scrolledID)

                
                //컴포넌트로 만들기
                Button {
                    hasSeenOnboarding = true
                    profileAnimal = scrolledID.viewID(type: Animal.ID.self)?.uuidString
                    
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
    OnboardingView()
}
