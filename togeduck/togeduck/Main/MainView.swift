//
//  MainView.swift
//  togeduck
//
//  Created by YejiMac on 2022/04/06.
//

import SwiftUI


struct MainView: View {
    
    let group_title = ["라이딩을 좋아해요", "토트넘을 좋아해요", "30분 거리에 있어요", "농구를 좋아해요","수영 좋아해요","패션을 좋아해요","희귀한 취미가 있어요"]
    
    let riding_characters = ["girl", "boy","girl","boy"]
    var body: some View {
        Text("MainView")
            .padding()
        VStack{
            ForEach(0..<7){_ in
                Button(action: {
                }) {
                    VStack{
                        Text("라이딩을 좋아해요")
                        HStack {
                            ForEach(0..<4){_ in
                                Image("girl")
                            }
                        }

                    }.background()
                }
            }
        
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
        }
    }
}
