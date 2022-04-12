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
                
                Text(user.introduction)
                    .font(.system(size: 15))
                    .padding(8.0)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0.216, green: 0.216, blue: 0.216))
                    )
                    .padding(.top, 20)

                user.image
                    .resizable()
                    .frame(width: 140, height: 180)
                    .padding()
                
                Text(user.name)
                    .font(.title)
                    .padding(.top, -10)
                
                Text("\(user.distance)km 이내에 있어요")
                    .foregroundColor(Color.gray)
                    .padding(.top, -10)
                
                // SwiftUILowLayout 패키지를 사용해서 tag view 를 자동으로 생성
//                FlowLayout(mode: .scrollable, items: user.hobbies, itemSpacing: 4) {
//                    let name = $0
//
//                    Text(name.hobbyName)
//                        .padding(.horizontal)
//                        .frame(height: 35)
//                        .background(Color("DarkGray"))
//                        .foregroundColor(Color.white)
//                        .clipShape(RoundedRectangle(cornerRadius: 30))
//
//                }.padding()
                
                HobbyList(name: user.hobbies)
                    .padding()
                    
                HStack {
                    
                    Image(systemName: "heart.fill")
                    
                    Text("\(user.subscribes)")
                        .padding(.trailing, 5)
                    
                    Image(systemName: "person.fill")
                    
                    Text("\(user.friends)")
                    
                }
                .padding(.bottom, 30)
                
                GridView(post: user.hobbies)
                    .frame(width: geometry.size.width, height: geometry.size.height/3.7)
                    
            }
        }
    }
}

struct HobbyList: View {
    
    @State var count = 0
    var name : [Hobby]
    
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack {
                
                ForEach(name.last)
                
                ForEach(name) { index in
                    Text(index.hobbyName)
                        .padding(.horizontal)
                        .frame(height: 35)
                        .background(Color("DarkGray"))
                        .foregroundColor(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))

                }
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
            .padding(.vertical)
        }
    }
}

struct userPostImageView: View {

    var postImage: [Post]

    var body: some View {
        ForEach(postImage) { index in
            index.postImage
                .resizable()
        }
    }
}
