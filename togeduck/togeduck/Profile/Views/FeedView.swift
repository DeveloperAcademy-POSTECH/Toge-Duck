//
//  FeedView.swift
//  togeduck
//
//  Created by COBY_PRO on 2022/04/12.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing: 8){
                ForEach(0 ..< 3){ index in
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 10) {
                            Image("profileImage1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.Gray200, lineWidth: 1))
                            VStack(alignment: .leading, spacing: 2) {
                                Text("스키피")
                                    .font(.system(size: 16, weight: .bold))
                                HStack(spacing: 2) {
                                    Text("1시간 전")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(.Gray500)
                                    Text("•")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(.Gray500)
                                    Text("3km이내")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(.Gray500)
                                }//HStack
                            }//VStack
                        }//Hstack
                        Image("feed_image_sample")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(12)
                        Text("토트넘 4:0 아스톤빌라")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.horizontal, 8)
                            .padding(.top, 12)
                        Text("아자자자~ 아자자자 아자자 아자자자 아자자 아자자 아자 두 줄 텍스트")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(.Gray600)
                            .lineSpacing(10)
                            .padding(.horizontal, 8)
                            .padding(.top, 2)
                            .lineLimit(1)
                        Spacer()
                    }//VStack
                }//ForEach
            }//VStack
        }//ScrollView
        .padding(16)
    }//body
}//struct

extension Color {
    static let Gray600 = Color(red: 0.4, green: 0.4, blue: 0.4)
    static let Gray500 = Color(red: 0.5, green: 0.5, blue: 0.5)
    static let Gray200 = Color(red: 0.8, green: 0.8, blue: 0.8)
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
