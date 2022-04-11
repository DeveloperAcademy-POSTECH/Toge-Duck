//
//  ProfileHobbyContent.swift
//  togeduck
//
//  Created by 이성민 on 2022/04/11.
//

import SwiftUI

struct ProfileHobbyContent: View {
    var member: Member
    var hobby: Hobby
    var body: some View {
        VStack{
            ForEach(hobby.hobbyPost){ post in
                Button(action: {}){
                    ProfileHobbyCard(post: post)
                        .padding([.top, .bottom], 10)
                        .foregroundColor(Color.black)
                        
                }
//                ProfileHobbyCard(post: post)
//                    .padding([.top, .bottom], 10)
            }
            .padding([.leading, .trailing], 10)
        }
    }
}

struct ProfileHobbyCard: View {
    var post: Post
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading) {
                Text(post.postTitle)
                    .padding(.bottom, 5)
                    .font(.system(size:20, weight: .bold))
                Text(post.postContent)
                    .font(.system(size: 15))
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
            post.postImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .clipped()
        }
        .padding([.leading, .trailing], 10)
    }
}

struct ProfileHobbyContent_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHobbyContent(member: members[0], hobby: members[0].hobbies[1])
    }
}
