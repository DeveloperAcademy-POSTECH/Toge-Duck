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
//    var post: Post
    var body: some View {
        VStack{
//            List(hobby.hobbyPost){ post in
//                ProfileHobbyCard(post: post)
//            }
//            ForEach(hobby.hobbyPost){ post in
//                ProfileHobbyCard(post: post)
//            }
        }
    }
}

struct ProfileHobbyCard: View {
    var post: Post
    var body: some View {
        HStack{
            Text(post.postTitle)
        }
    }
}

struct ProfileHobbyContent_Previews: PreviewProvider {
    static var previews: some View {
//        ProfileHobbyContent(post: members[0].hobbies[0].hobbyPost[0])
        ProfileHobbyCard(post: members[0].hobbies[0].hobbyPost[0])
    }
}
