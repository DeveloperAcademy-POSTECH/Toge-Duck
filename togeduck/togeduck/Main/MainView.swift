//
//  MainView.swift
//  togeduck
//
//  Created by YejiMac on 2022/04/06.
//

import SwiftUI

//struct cardData: Identifiable{
//    var group_title: String
//    var image_list: String
//}


struct MainView: View {
//    let data: [cardData] = [
//        cardData(group_title: "라이딩을 좋아해요", image_list: "boy"),
//        cardData(group_title: "축구를 좋아해요", image_list: "boy"),
//        cardData(group_title: "30분 거리에 있어요", image_list: "girl"),
//        cardData(group_title: "30분 거리에 있어요", image_list: "girl"),
//        cardData(group_title: "30분 거리에 있어요", image_list: "girl"),
//        cardData(group_title: "30분 거리에 있어요", image_list: "girl"),
//    ]
    
//    init() {
//        UITableView.appearance().separatorColor = .clear
//    }
    
    var body: some View {
        
        NavigationView {
            VStack{

                    ForEach(0..<5){_ in
                        NavigationLink(destination: Text("프로필 슬라이드")) {
                            CardView()
                        }
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.sRGB,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 1)
                        )
                        .padding(3)
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
            HStack {
                ForEach(0..<5){_ in
                    Image("girl")
                }
            Image("greaterthan")
            }
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
        }
    }
}
