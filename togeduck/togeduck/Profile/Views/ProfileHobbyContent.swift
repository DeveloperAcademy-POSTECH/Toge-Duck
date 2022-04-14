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
            HStack{
                Spacer()
                NavigationLink(destination: CreateContentView(hobbyForTitle: hobby.hobbyName)){
                    Image(systemName: "square.and.pencil")
                        .font(Font.system(size:20, weight: .semibold))
                        .padding([.top], 5)
                        .padding([.trailing])
                        .foregroundColor(Color(red:0.216, green: 0.216, blue: 0.216))
                }
//                ProfileHobbyContent(member: member, hobby: member.hobbies[hobbyNum])
                
            }
            ForEach(hobby.hobbyPost){ post in
                Button(action: {
                }){
                    NavigationLink(destination: ContentDetailView(member: member, hobby: hobby, post: post)){
                        ProfileHobbyCard(post: post)
                            .padding([.top, .bottom], 10)
                            .foregroundColor(Color.black)
                    }    
                }
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
