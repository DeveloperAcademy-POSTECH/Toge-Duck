//
//  FeedView.swift
//  togeduck
//
//  Created by COBY_PRO on 2022/04/12.
//

import SwiftUI

struct FeedView: View {
    var members: [Member]
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing: 8){
                ForEach(members){ member in
                    ForEach(member.hobbies){ hobby in
                        ForEach(hobby.hobbyPost){ post in
                            VStack(alignment: .leading, spacing: 4) {
                                HStack(spacing: 10) {
                                    member.image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.Gray200, lineWidth: 1))
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(member.name)
                                            .font(.system(size: 16, weight: .bold))
                                        HStack(spacing: 2) {
                                            Text("1시간 전")
                                                .font(.system(size: 14, weight: .medium))
                                                .foregroundColor(.Gray500)
                                            Text("•")
                                                .font(.system(size: 14, weight: .medium))
                                                .foregroundColor(.Gray500)
                                            Text("\(member.distance)km이내")
                                                .font(.system(size: 14, weight: .medium))
                                                .foregroundColor(.Gray500)
                                        }//HStack
                                    }//VStack
                                }//Hstack
                                post.postImage
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(12)
                                VStack (alignment: .leading){
                                    HStack {
                                        Text(post.postTitle)
                                            .font(.system(size: 16, weight: .bold))
                                    }
                                    .padding(.top, 12)
                                    Text(post.postContent)
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundColor(.Gray600)
                                        .padding(.top, -5)
                                        .lineLimit(1)
                                }
                                .padding(.horizontal, 8)
                            }
                            Divider()
                                .padding([.top, .bottom], 10)
                        }
                    }
                    
                }//ForEach
            }//VStack
        }//ScrollView
        .padding(16)
        .navigationBarTitle(Text("피드"), displayMode: .inline)
    }//body
}//struct

extension Color {
    static let Gray600 = Color(red: 0.4, green: 0.4, blue: 0.4)
    static let Gray500 = Color(red: 0.5, green: 0.5, blue: 0.5)
    static let Gray200 = Color(red: 0.8, green: 0.8, blue: 0.8)
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(members:members)
    }
}
