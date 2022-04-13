//
//  ProfileHobbyButton.swift
//  togeduck
//
//  Created by 이성민 on 2022/04/10.
//

import SwiftUI

struct ProfileHobbyButton: View {
    
    @Binding var hobbyNum: Int
    var member: Member

    var body: some View {
        VStack{
            Divider()
                .padding([.bottom], 5)
            HStack{
                ForEach(member.hobbies){ hobby in
                    if hobbyNum == member.hobbies.firstIndex(where: {$0 == hobby}){
                        Button(action:{
                            hobbyNum = member.hobbies.firstIndex(where: {$0 == hobby})!
                        }){
                            Text(hobby.hobbyName)
                        }
                        .buttonStyle(HobbyButtonStyleSelected())
                    } else {
                        Button(action:{
                            hobbyNum = member.hobbies.firstIndex(where: {$0 == hobby})!
                        }){
                            Text(hobby.hobbyName)
                        }
                        .buttonStyle(HobbyButtonStyleBase())
                    }
//                    Button(action:{
//                        hobbyNum = member.hobbies.firstIndex(where: {$0 == hobby})!
//                    }){
//                        Text(hobby.hobbyName)
//                    }
//                    .buttonStyle(HobbyButtonStyle())
                }
            }
            Divider()
                .padding(.top, 5)
        }
    }
}

struct HobbyButtonStyleSelected: ButtonStyle{
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size:12, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .padding(7)
            .background(Color(red:0.216, green: 0.216, blue: 0.216))
            .clipShape(Capsule())
    }
}
            
struct HobbyButtonStyleBase: ButtonStyle{
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size:12, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .padding(7)
            .background(Color(red: 0.84375, green: 0.84375, blue: 0.84375))
            .clipShape(Capsule())
    }
}

struct ProfileHobbyButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHobbyButton(hobbyNum: .constant(0), member:members[0])
    }
}
