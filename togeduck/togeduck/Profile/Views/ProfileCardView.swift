//
//  ProfileCardView.swift
//  togeduck
//
//  Created by ParkJunHyuk on 2022/04/11.
//

import SwiftUI
import SwiftUIFlowLayout

struct ProfileCardView: View {
    
    var user : Member
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                
                ProfileDetailView(member: user)
                Divider()
                    .padding(.bottom, 5)
                HobbyList(name: user.hobbies)
                Divider()
                    .padding(.top, 5)
                GridView(post: user.hobbies)
                    .frame(width: geometry.size.width, height: geometry.size.height/3)
                //
            }
            .padding(.top, 30)
        }
    }
}

struct HobbyList: View {
    
    @State var count = 0
    var name : [Hobby]
    
    var body: some View {
        
        HStack {
            ForEach(name) { index in
                Text(index.hobbyName)
                    .font(.system(size:12, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(7)
                    .background(Color(red:0.216, green: 0.216, blue: 0.216))
                    .clipShape(Capsule())
                
            }
        }
        
    }
}

struct ProfileCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileCardView(user: members[0])
        }
    }
}

struct GridView: View {
    
    var post : [Hobby]
    
    let rows: [GridItem] = [
        GridItem(.adaptive(minimum: 80), spacing: 0)
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: rows, alignment: .center, spacing: 0
            ) {
                ForEach(post) { index in
                    
                    userPostImageView(postImage: index.hobbyPost)
                        .frame(height: 100)
                }
            }
        }
    }
}

struct userPostImageView: View {
    
    var postImage: [Post]
    
    var body: some View {
        ForEach(postImage) { index in
            index.postImage
                .resizable()
            //                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 100, maxHeight:100)
        }
    }
}
