//
//  MessageView.swift
//  togeduck
//
//  Created by 이성민 on 2022/04/14.
//

import SwiftUI

struct MessageView: View {
    var message: [SendMessage]
    
    var body: some View {
        List {
            ForEach(message) { index in
                NavigationLink(destination: SendMessageView(messageUser: index.name), label: {
                    HStack {
                        index.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.Gray200, lineWidth: 1))
                        
                        VStack (alignment: .leading){
                            Text(index.name)
                                .font(.title2)
                                .fontWeight(.bold)
                                
                            
                            Text(index.message)
                        }
                    }
                })
            }
        }.listStyle(PlainListStyle())
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: messages)
    }
}

struct MessageCardView : View {
    var body: some View {
        
        HStack {
//            Image()
        }
    }
}
