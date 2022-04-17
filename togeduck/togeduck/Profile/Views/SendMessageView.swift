//
//  SendMessageView.swift
//  togeduck
//
//  Created by ParkJunHyuk on 2022/04/17.
//

import SwiftUI

struct SendMessageView: View {
    
    var messageUser : String
    @State private var showModal = false
    
    var body: some View {
        VStack(alignment: .leading){
            
            VStack (alignment: .leading) {
                Text("Haru")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text("같이 와인 한잔 하러 가실래요?")
            }
            
            Divider()
            
            VStack (alignment: .leading) {
                Text("Id")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text("맞아요! 그런데 취미로 갖기에는 너무 지식이 없네요")
            }
//            .padding()
            
            Divider()
//                .padding()
            
            VStack (alignment: .leading){
                Text("Haru")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text("안녕하세요! 와인이 취미시네요!")
            }
            
            
            Spacer()
            
        }
        .padding()
        .navigationTitle("\(messageUser)")
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    self.showModal = true
                }, label: {
//                    Text("보내기")
                    Image(systemName: "pencil")
                })
                .sheet(isPresented: self.$showModal) {
                    SendMessageModalView()
                }
            }
        }
    }
}

struct SendMessageView_Previews: PreviewProvider {
    static var previews: some View {
        SendMessageView(messageUser: messages[0].name)
    }
}
