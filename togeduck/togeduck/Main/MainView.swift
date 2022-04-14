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
                    NavigationLink(destination: ProfileBoardView()) {
                        CardView(card: card)
                    }
//                    .background(RoundedRectangle(cornerRadius: 20)
//                        .stroke(Color(.sRGB,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 1.5))
//                        .shadow(color: Color.white, radius: 3, x: 3, y: 3)
//                        .shadow(color: Color.black, radius: 5, x: 0, y: 0))
//                    .background(Color.white)
//                    .background(RoundedRectangle(cornerRadius: 30)
//                        .stroke(Color(.sRGB,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 1)
//                        .shadow(color: Color.black, radius: 6, x: 0, y: 0))
                    .padding(6.0)
                }
            }
            .navigationTitle(Text("MainView"))
        })
    }
}



struct CardView: View{
    
    let card: MainCardData
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 360, height: 140)
                .foregroundColor(Color.white)
                .shadow(color: Color.gray.opacity(0.3), radius: 2, x: 3, y: 3)
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color(.sRGB,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 1.5)
                .frame(width: 360, height: 140)
            HStack {
                VStack(alignment: .leading){
                    Text(card.group_title)
                        .foregroundColor(.primary)
                        .padding(.leading, 25)
                        .padding(.top, 16.0)
                        .padding(.bottom, -12)
                        .font(.system(size: 18, weight: .semibold))
                    HStack {
                        ForEach(card.dotimgs, id: \.self){ dotimg in
                            Image(dotimg)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width:50, height: 70)
                                
                        }
                        //                    Spacer()
                        
                    }
                    .padding([.top, .bottom, .trailing])
                    .padding(.leading)
                    .frame(minWidth:250)
                }
                Image("greaterthan")
                    .padding(.trailing, 25)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView(cards: MainCardData.sampleData)
        }
    }
}
