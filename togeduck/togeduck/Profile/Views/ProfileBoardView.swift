//
//  ProfileBoardView.swift
//  togeduck
//
//  Created by ParkJunHyuk on 2022/04/11.
//

import SwiftUI

struct ProfileBoardView: View {
    var body: some View {
        GeometryReader { geometry in
            TabView() {
                ForEach(members) { index in
                    NavigationLink(destination: ProfileView()){
                        ProfileCardView(user: index)
                            .frame(width: geometry.size.width - 30, height: geometry.size.height - 70)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .shadow(color: .gray, radius: 5, x: 3, y: 5)
                            .padding(.bottom, 60)
                            .accentColor(.black)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))

        }
    }
}

struct ProfileBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileBoardView()
    }
}
