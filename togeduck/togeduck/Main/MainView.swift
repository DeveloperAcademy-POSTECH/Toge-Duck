//
//  MainView.swift
//  togeduck
//
//  Created by YejiMac on 2022/04/06.
//

import SwiftUI


struct MainView: View {

//    let group_titles = ["라이딩을 좋아해요", "토트넘을 좋아해요", "30분 거리에 있어요", "농구를 좋아해요","수영 좋아해요","패션을 좋아해요","희귀한 취미가 있어요"]
    
    
    var body: some View {
        Text("MainView")
            .padding()
        VStack{
//            ForEach(group_titles, id: \.self){
            ForEach(0..<7){_ in
                Button(action: {
                }){
                    CardView()
                        .background(RoundedRectangle(cornerRadius: 10)
                            
                        )
                }
            }
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
                ForEach(0..<4){_ in
                    Image("girl")
                }
            }
        }
//        .cornerRadius(10)
//        .padding([.top, .horizontal])
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
        }
    }
}
