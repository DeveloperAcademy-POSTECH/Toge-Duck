//
//  MainView.swift
//  togeduck
//
//  Created by YejiMac on 2022/04/06.
//

import SwiftUI



struct MainView: View {
    let cards: [MainCardData]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content:{
                VStack{
                    ForEach(cards){ card in
                            NavigationLink(destination: Text("프로필 슬라이드")) {
                                CardView(card: card)
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
            })
    }
}



struct CardView: View{
    let card: MainCardData
//    let dotimgs: MainCardData.dotimgs
    
    var body: some View {
        VStack{
            Text(card.group_title)
                .foregroundColor(.primary)
                .padding(.leading, -140.0)
                .padding(.top, 16.0)
                .padding(.bottom, -6)
                .font(.system(size: 18, weight: .semibold))
            HStack {
                ForEach(card.dotimgs, id: \.self){ dotimg in
                    Image(dotimg)
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
//    static var card = MainCardData.sampleData[0]
    static var previews: some View {
        Group {
            MainView(cards: MainCardData.sampleData)
        }
    }
}
