//
//  BottomTabView.swift
//  togeduck
//
//  Created by ParkJunHyuk on 2022/04/11.
//

import SwiftUI

struct BottomTabView: View {
    
    @State private var selection = 0
    
    var body: some View {
        
        TabView(selection: $selection) {
            ProfileBoardView()
                .tabItem{
                    Image(systemName: "house")
                }
                .tag(0)
            
            ProfileView()
                .tabItem{
                    Image(systemName: "highlighter")
                }
                .tag(1)
            
            Text("세번째 뷰")
                .tabItem{
                    Image(systemName: "envelope.fill")
                }
                .tag(2)
                
            
            Text("네번째 뷰")
                .tabItem{
                    Image(systemName: "person.fill")
                }
                .tag(3)
        }
        .accentColor(.black)
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
    }
}
