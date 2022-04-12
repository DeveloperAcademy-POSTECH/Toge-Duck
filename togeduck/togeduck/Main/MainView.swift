//
//  MainView.swift
//  togeduck
//
//  Created by YejiMac on 2022/04/06.
//

import SwiftUI

//struct cardData {
//    var group_title: String
//    var image_list: [String]
//}


struct MainView: View {
//    let data: [cardData] = [
//        cardData(group_title: "라이딩을 좋아해요", image_list: ["dotimg1", "dotimg2", "dotimg3"]),
//        cardData(group_title: "축구를 좋아해요", image_list: ["dotimg1", "dotimg2", "dotimg3"]),
//        cardData(group_title: "30분 거리에 있어요", image_list: ["dotimg1", "dotimg2", "dotimg3"]),
//        cardData(group_title: "30분 거리에 있어요", image_list: ["dotimg1", "dotimg2", "dotimg3"]),
//        cardData(group_title: "30분 거리에 있어요", image_list: ["dotimg1", "dotimg2", "dotimg3"]),
//        cardData(group_title: "30분 거리에 있어요", image_list: ["dotimg1", "dotimg2", "dotimg3"]),
//    ]
    
//    init() {
//        UITableView.appearance().separatorColor = .clear
//    }
    
    var body: some View {
            ScrollView{
                VStack{
                        ForEach(0..<5){_ in
                            NavigationLink(destination: Text("프로필 슬라이드")) {
                                CardView()
                            }
                            
                            .background(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(.sRGB,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 1)
                                .shadow(color: Color.white, radius: 3, x: 3, y: 3)
                                .shadow(color: Color.gray, radius: 5, x: 0, y: 0)
                            )
                            .background(Color.white)
                            .background(RoundedRectangle(cornerRadius: 30)
                                .stroke(Color(.sRGB,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 1)
                                .shadow(color: Color.black, radius: 6, x: 0, y: 0)
                            )
                            .padding(6.0)
                        }
                }
                .navigationTitle(Text("MainView"))
            }
    }
}



struct CardView: View{
//    var group_title:String
//    var riding_characters: String
    
    var body: some View {
        VStack{
            Text("라이딩을 좋아해요")
                .foregroundColor(.primary)
                .padding(.leading, -140.0)
                .padding(.top, 16.0)
                .padding(.bottom, -6)
                .font(.system(size: 18, weight: .semibold))
            HStack {
                ForEach(0..<5){_ in
                    Image("dotimg5")
                }
            Image("greaterthan")
            }
            .padding(9.0)
        }
        .padding(4)
        .padding(.horizontal, 10.0)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
        }
    }
}
