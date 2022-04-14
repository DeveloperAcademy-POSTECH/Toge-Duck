//
//  CreateContentView.swift
//  togeduck
//
//  Created by 이성민 on 2022/04/14.
//

import SwiftUI

struct CreateContentView: View {
    @State private var title: String = ""
    @State private var hobby: String = ""
    @State private var content: String = ""
    
    //    @Binding var hobbyNum: Int
    
    var hobbyForTitle: String
    var body: some View {
        VStack {
            VStack {
                TextField("제목", text: $title)
                    .disableAutocorrection(true)
                    .padding(.bottom, 5)
                Divider()
                TextField("내용", text: $content)
                    .disableAutocorrection(true)
                    .padding(.top, 5)
            }
            .padding([.leading, .trailing])
            .navigationTitle(hobbyForTitle)
            .toolbar{
                Button(action: {}){
                    Text("글쓰기")
                        .foregroundColor(Color.white)
                        .font(.system(size: 15))
                        .background(RoundedRectangle(cornerRadius: 15)
                            .frame(width:55, height: 25)
                            .foregroundColor(Color(red: 0.216, green: 0.216, blue: 0.216)))
                        .padding(.trailing, 10)
                }
                
            }
            Spacer()
        }
        .padding()
        
        
    }
}

struct CreateContentView_Previews: PreviewProvider {
    static var previews: some View {
        CreateContentView(hobbyForTitle: members[0].hobbies[0].hobbyName)
    }
}
