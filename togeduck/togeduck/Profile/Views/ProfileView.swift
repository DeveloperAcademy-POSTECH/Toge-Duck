//
//  ProfileView.swift
//  togeduck
//
//  Created by 이성민 on 2022/04/08.
//

import SwiftUI

struct ProfileView: View {
    
//    @State var isHide = false
    @State var hobbyNum : Int = 0
    var body: some View {
        VStack{
            VStack{
                Color.white
                    .frame(height: 10)
                    .edgesIgnoringSafeArea(.top)
                    .background(Color.white)
            }
            ScrollView{
                VStack{
                    ProfileDetailView(member: members[0])
                    LazyVStack(pinnedViews:[.sectionHeaders]){
                        Section(header: ProfileHobbyButton(hobbyNum: $hobbyNum, member:members[0])
                            .background(Color.white)){
                            ProfileHobbyContent(member: members[0], hobby: members[0].hobbies[hobbyNum])
                        }
                    }
                }
                .padding(.top, 30)
            }
            
    //        .frame(maxHeight: .infinity)
    //        .edgesIgnoringSafeArea(.top)
    //        .background(Color.white)
        }
        }
        
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
