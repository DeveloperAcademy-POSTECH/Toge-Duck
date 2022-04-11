//
//  ProfileBoardView.swift
//  togeduck
//
//  Created by ParkJunHyuk on 2022/04/11.
//

import SwiftUI

struct ProfileBoardView: View {
    var body: some View {
        NavigationView {
            TabView() {
                ForEach(members) { index in
                    NavigationLink(destination: ProfileView()){
                        ProfileCardView(user: index)
                            .frame(maxWidth: .infinity, maxHeight: .infinity - 200)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .shadow(color: .gray, radius: 5, x: 3, y: 5)
                            .padding()
                            .accentColor(.black)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .navigationBarHidden(true)
        }
    }
}

struct ProfileBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileBoardView()
    }
}
