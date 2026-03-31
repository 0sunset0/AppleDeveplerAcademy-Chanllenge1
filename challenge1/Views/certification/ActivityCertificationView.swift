//
//  ActivityCertificationView.swift
//  challenge1
//
//  Created by 노을 on 3/27/26.
//

import SwiftUI
import PhotosUI

struct ActivityCertificationView: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack(){
            Text("제이슨 추천 러닝 코스")
                .font(.title)
                .bold()
                .padding()
        
            if let selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(30)
                
            } else {
                Image(systemName: "camera.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(30)
                
            }

            
            PhotosPicker(
                selection: $selectedItem,
                matching: .images
            ) {
                Text("Select Multiple Photos")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .onChange(of: selectedItem) {
                Task {
                    //여기 코드 이해 필요...
                    if let data = try? await selectedItem?.loadTransferable(type: Data.self),
                       let image = UIImage(data: data) {
                        selectedImage = image
                        }
                    }
            }
            
            
            //컴포넌트로 만들기
            Button {
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

#Preview {
    ActivityCertificationView()
}
