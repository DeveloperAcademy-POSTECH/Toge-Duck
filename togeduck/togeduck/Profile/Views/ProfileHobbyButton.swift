//
//  ProfileHobbyButton.swift
//  togeduck
//
//  Created by 이성민 on 2022/04/10.
//

import SwiftUI

struct ProfileHobbyButton: View {
    var hobby: Hobby
    
    var body: some View {
        Button(action:{
            
        }){
            Text(hobby.hobbyName)
        }
        .buttonStyle(HobbyButtonStyle())
    }
}

struct HobbyButtonStyle: ButtonStyle{
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size:12, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .padding(7)
            .background(Color(red:0.216, green: 0.216, blue: 0.216))
            .clipShape(Capsule())
    }
}

struct ProfileHobbyButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHobbyButton(hobby:members[0].hobbies[0])
    }
}
