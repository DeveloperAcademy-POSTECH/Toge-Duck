//
//  ProfileCardView.swift
//  togeduck
//
//  Created by ParkJunHyuk on 2022/04/11.
//

import SwiftUI

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
                    .frame(width: geometry.size.width, height: geometry.size.height/1.8)
                    
            }
        }
    }
}

struct HobbyList: View {
    
    @State var count = 0
    var name : [Hobby]
    
    var body: some View {
        HStack {
            if name.count > 3 {
                ForEach(0..<3){ index in
                    
                    Text(name[index].hobbyName)
                        .padding(.horizontal)
                        .frame(height: 35)
                        .background(Color("DarkGray"))
                        .foregroundColor(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
                
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                
                Text("\(name.count-3)")
                    .font(.system(size: 25))
                
            } else {
                ForEach(0..<name.count){ index in
                    
                    Text(name[index].hobbyName)
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
    
    @State var count = 0
    
    var post : [Hobby]
    
    let rows: [GridItem] = [
        GridItem(spacing: 0),
        GridItem(spacing: 0),
        GridItem(spacing: 0),
        GridItem(spacing: 0)

    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: rows, alignment: .center, spacing: 0
            ) {
                ForEach(post) { index in
                    userPostImageView(count: $count, postImage: index.hobbyPost)
                        .frame(height: 100)
                }
            }
            .padding(.vertical)
        }
    }
}

struct userPostImageView: View {
    
    @Binding var count : Int
    var postImage: [Post]

    var body: some View {
        ForEach(postImage) { index in
            index.postImage
                .resizable()
        }
        .onAppear(){
            count += 1
        }
    }
}
