//
//  OthersProfileView.swift
//  togeduck
//
//  Created by 이성민 on 2022/04/14.
//

import SwiftUI

struct OthersProfileView: View {
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
                                ForEach(member.hobbies[hobbyNum].hobbyPost){ post in
                                    Button(action: {
                                    }){
                                        NavigationLink(destination: ContentDetailView(member: member, hobby: member.hobbies[hobbyNum], post: post)){
                                            ProfileHobbyCard(post: post)
                                                .padding([.top, .bottom], 10)
                                                .foregroundColor(Color.black)
                                        }
                                    }
                                }
                                .padding([.leading, .trailing], 10)
                            }
                    }
                    .padding(.top, 20)
                }
            }
        }
    }
}

struct OthersProfileView_Previews: PreviewProvider {
    static var previews: some View {
        OthersProfileView(member: members[0])
    }
}
