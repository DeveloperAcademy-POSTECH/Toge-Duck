//
//  ContentDetailView.swift
//  togeduck
//
//  Created by 이성민 on 2022/04/12.
//

import SwiftUI

struct ContentDetailView: View {
    var member: Member
    var hobby: Hobby
    var post: Post
    @State var isFavorite: Bool = false
    var body: some View {
        ScrollView{
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
                            Text("3km이내")
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
                        Spacer()
                        Button(action:{
                            self.isFavorite.toggle()
                        }){
                            if isFavorite{
                                Image(systemName: "heart.fill")
                                    .foregroundColor(Color.black)
                            } else {
                                Image(systemName: "heart")
                                    .foregroundColor(Color.black)
                            }
                            
                        }
                        
                    }
                    .padding(.top, 12)
                    Text(post.postContent)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.Gray600)
                        .padding(.top, 2)
                }
                .padding(.horizontal, 8)
            }
            .padding()
        }
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView(member: members[0], hobby: members[0].hobbies[0], post: members[0].hobbies[0].hobbyPost[0])
    }
}
