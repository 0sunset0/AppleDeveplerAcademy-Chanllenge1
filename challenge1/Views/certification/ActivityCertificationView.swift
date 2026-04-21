//
//  ActivityCertificationView.swift
//  challenge1
//
//  Created by 노을 on 3/27/26.
//

import SwiftUI
import PhotosUI

struct ActivityCertificationView: View {
    @State var selectedItem: PhotosPickerItem?
    @State var selectedImage: UIImage?
    @Environment(\.dismiss) private var dismiss
    let todayChallenge: TodayChallenge
    
    
    var isImageSelected: Bool {
        return selectedImage != nil
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                CertificationImageView(selectedImage: $selectedImage)
                CertificationButton(isImageSelected: isImageSelected, todayChallenge: todayChallenge)
                
            }.toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button("취소"){
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    ActivityCertificationView(todayChallenge: TodayChallenge.dummies[0])
}
