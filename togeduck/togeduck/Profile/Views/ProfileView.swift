//
//  ProfileView.swift
//  togeduck
//
//  Created by 이성민 on 2022/04/08.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            ProfileDetailView(member:members[0])
            Divider()
                .padding(5)
            ProfileHobbyView(member:members[0])
            Divider()
                .padding(5)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
