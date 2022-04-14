//
//  ProfileView.swift
//  togeduck
//
//  Created by 이성민 on 2022/04/08.
//

import SwiftUI

struct ProfileView: View {
    
    @State var hobbyNum : Int = 0
    var member: Member
    var body: some View {
        VStack{
            VStack{
                Color.white
                    .frame(height: 1)
                    .edgesIgnoringSafeArea(.top)
                    .background(Color.white)
            }
            ScrollView{
                VStack{
                    ProfileDetailView(member: member)
                    LazyVStack(pinnedViews:[.sectionHeaders]){
                        Section(header: ProfileHobbyButton(hobbyNum: $hobbyNum, member:member)
                            .background(Color.white)){
                            ProfileHobbyContent(member: member, hobby: member.hobbies[hobbyNum])
                        }
                    }
                }
                .padding(.top, 20)
            }
        }
    }
        
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(member: members[0])
    }
}
