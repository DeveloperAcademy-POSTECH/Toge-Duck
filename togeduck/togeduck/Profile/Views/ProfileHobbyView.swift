//
//  ProfileHobbyView.swift
//  togeduck
//
//  Created by 이성민 on 2022/04/09.
//

import SwiftUI

struct ProfileHobbyView: View {
    var member: Member
    var body: some View {
        VStack {
            HStack{
                ForEach(member.hobbies, id:\.hobbyName){ c in
                    ProfileHobbyButton(hobby: c)
                        .buttonStyle(HobbyButtonStyle())
                }
            }
            
        }
    }
}

//struct HobbyButtonStyle: ButtonStyle{
//    func makeBody(configuration: Self.Configuration) -> some View {
//        configuration.label
//            .font(.system(size:12, weight: .bold, design: .rounded))
//            .foregroundColor(.white)
//            .padding(7)
//            .background(Color(red:0.216, green: 0.216, blue: 0.216))
//            .clipShape(Capsule())
//    }
//}

struct ProfileHobbyView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHobbyView(member: members[0])
    }
}
