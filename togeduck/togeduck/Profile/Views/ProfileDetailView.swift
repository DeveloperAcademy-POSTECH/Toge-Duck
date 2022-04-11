//
//  ProfileDetailView.swift
//  togeduck
//
//  Created by 이성민 on 2022/04/08.
//

import SwiftUI

struct ProfileDetailView: View {
    var member: Member
    var body: some View {
        VStack {
            Text(member.introduction)
                .font(.system(size: 15))
                .padding(8.0)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0.216, green: 0.216, blue: 0.216))
                )
            member.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 160, height: 160)
                .clipShape(Rectangle())
            Text(member.name)
                .fontWeight(.heavy)
                .font(.system(size:25))
//                .padding(.top, -15)
            Text("10km 이내에 있어요")
                .font(.system(size: 15))
                .foregroundColor(Color(red: 0.216, green: 0.216, blue: 0.216))
//                .padding(.top, -5.0)
            HStack {
                Image(systemName: "heart.fill")
                Text("\(member.subscribes)")
                Image(systemName: "person.fill")
                Text("\(member.friends)")
            }
            .padding(.top, -1.0)
        }
    }
}

struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailView(member:members[1])
    }
}
