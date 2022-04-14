//
//  BottomTabView.swift
//  togeduck
//
//  Created by ParkJunHyuk on 2022/04/11.
//

import SwiftUI

struct BottomTabView: View {
    
    @State private var selection = 0
    @State var tabNum = 0
    
    var navTitle: [String] = ["투게덕", "쪽지", "프로필"]
    var body: some View {
        
        TabView(selection: $selection) {
            MainView(cards: MainCardData.sampleData)
                .tabItem{
                    Image(systemName: "house")
                }
                .navigationBarTitle(Text("투게덕"), displayMode: .inline)
                .tag(0)
            
            FeedView(members:members)
                .tabItem{
                    Image(systemName: "heart.fill")
                }
                .tag(1)
            
            Text("세번째 뷰")
                .tabItem{
                    Image(systemName: "envelope.fill")
                }
                .navigationBarTitle(Text("쪽지"), displayMode: .inline)
//                .onTapGesture{
//                    tabNum = 2
//                }
                .tag(2)
                
            
            ProfileView(member:members[0])
                .tabItem{
                    Image(systemName: "person.fill")
                }
                .onTapGesture{
                    tabNum = 2
                }
                .tag(3)
        }
        .navigationTitle(navTitle[tabNum])
        .accentColor(.black)
    }
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView(tabNum: 0)
    }
}
