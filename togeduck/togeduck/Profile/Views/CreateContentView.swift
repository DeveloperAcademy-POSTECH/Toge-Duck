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
    
    var hobbies: [Hobby]
    var body: some View {
        VStack {
            VStack {
                TextField("제목", text: $title)
                    .disableAutocorrection(true)
                HStack {
                    Picker("취미선택", selection: $hobby){
                        ForEach(hobbies){ hobby in
                            Text(hobby.hobbyName)
                                .foregroundColor(Color.black)
                        }
                    }
                    .pickerStyle(.menu)
                    Spacer()
                }
                Divider()
                TextField("내용", text: $content)
                    .disableAutocorrection(true)
            }
            Spacer()
            
        }
        .padding()
    }
}

struct CreateContentView_Previews: PreviewProvider {
    static var previews: some View {
        CreateContentView(hobbies: members[0].hobbies)
    }
}
