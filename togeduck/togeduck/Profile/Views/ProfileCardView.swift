//
//  ProfileCardView.swift
//  togeduck
//
//  Created by ParkJunHyuk on 2022/04/11.
//

import SwiftUI
import SwiftUIFlowLayout

struct ProfileCardView: View {
    
    var user : Member

    var body: some View {
        VStack {
            
            user.image
                .resizable()
                .frame(width: 160, height: 200)
                .padding()
            
            Text(user.name)
                .font(.title)
            
            Text("\(user.distance)km 이내에 있어요")
                .foregroundColor(Color.gray)
                .padding(.top, -10)
            
            // SwiftUILowLayout 패키지를 사용해서 tag view 를 자동으로 생성
            FlowLayout(mode: .scrollable, items: user.hobbies, itemSpacing: 4) {
                let name = $0
                
                Text(name.hobbyName)
                    .padding(.horizontal)
                    .frame(height: 35)
                    .background(Color("DarkGray"))
                    .foregroundColor(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                
            }.padding()
                
            HStack {
                
                Image(systemName: "heart.fill")
                
                Text("\(user.subscribes)")
                    .padding(.trailing, 5)
                
                Image(systemName: "person.fill")
                
                Text("\(user.friends)")
            }
            .padding()
            
            Spacer()
            
//            Rectangle()
//                .fill(Color.gray)
//                .frame(maxHeight: .infinity)
                
        }
    }
}

struct ProfileCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCardView(user: members[0])
    }
}
