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
    @State var barTitle = ""
    
    var navTitle: [String] = ["투게덕", "쪽지", "프로필"]
    var body: some View {
        
        TabView(selection: $selection) {
            MainView(cards: MainCardData.sampleData)
                .tabItem{
                    Image(systemName: "house")
                }
                .onAppear() {
                    self.barTitle = "투게덕"
                }
                .navigationBarTitle(Text("\(barTitle)"), displayMode: .inline)
                .tag(0)
            
            FeedView(members:members)
                .tabItem{
                    Image(systemName: "heart.fill")
                }
                .onAppear() {
                    self.barTitle = "피드"
                }
                .navigationBarTitle(Text("\(barTitle)"), displayMode: .inline)
                .tag(1)
            
            MessageView(message: messages)
                .tabItem{
                    Image(systemName: "envelope.fill")
                }
                .onAppear() {
                    self.barTitle = "쪽지"
                }
//                .navigationTitle(Text("\(barTitle)"))
//                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle(Text("\(barTitle)"), displayMode: .inline)
//                .onTapGesture{
//                    tabNum = 2
//                }
                .tag(2)
            
            ProfileView(member:members[0])
                .tabItem{
                    Image(systemName: "person.fill")
                }
                .onAppear() {
                    self.barTitle = "프로필"
                }
                .navigationBarTitle(Text("\(barTitle)"), displayMode: .inline)
                .tag(3)
        }
//        .navigationTitle(navTitle[tabNum])
        .accentColor(.black)
    }
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView(tabNum: 0)
    }
}
