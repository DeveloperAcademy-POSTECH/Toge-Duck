//
//  SendMessageModalView.swift
//  togeduck
//
//  Created by ParkJunHyuk on 2022/04/17.
//

import SwiftUI

struct SendMessageModalView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var content: String = ""
    
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 50)
                .fill(Color.gray)
                .frame(width: 150, height: 4)

            TextEditor(text: $content)
                .padding()
                .foregroundColor(Color.black)
                .lineSpacing(5)
                .frame(minWidth:0, maxWidth: .infinity, minHeight:0, maxHeight: 500)


            Spacer()


            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }){
                Text("보내기")
                    .foregroundColor(.white)
                    .frame(width: 360, height: 50)
                    .background(Color.black)
                    .clipShape(Capsule())
            }
        }
        .padding()
    }
}

struct SendMessageModalView_Previews: PreviewProvider {
    static var previews: some View {
        SendMessageModalView()
    }
}

//struct TextSend : View {
//
//    @Binding var send : String
//
//    init() {
//        UITextView.appearance().backgroundColor = .clear
//    }
//
//    var body: some View {
//        TextEditor(text: send)
//            .padding()
//            .foregroundColor(Color.black)
//            .lineSpacing(5)
//            .frame(minWidth:0, maxWidth: .infinity, minHeight:0, maxHeight: 500)
//    }
//}
