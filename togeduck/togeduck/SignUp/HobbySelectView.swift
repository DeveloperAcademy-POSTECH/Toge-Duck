//
//  HobbySelectView.swift
//  togeduck
//
//  Created by Yoonjae on 2022/04/08.
//

import SwiftUI
import SwiftUIFlowLayout


struct HobbySelectView: View {
    @State var searchingFor = ""
    @State private var select = [String]()
    @Environment(\.dismissSearch) var dismissSearch
    var favorite: [String] = ["라이딩", "축구", "농구", "야구", "넷플릭스", "재즈", "볼링", "밴드", "사진", "베이킹", "댄스"]
    var rare: [String] = ["락 밴드", "돌 수집", "종이접기", "누워있기", "파쿠르", "번지점프", "저글링", "미식축구"]
    let hobbies: [String] = ["라이딩", "축구", "농구", "야구", "넷플릭스", "재즈", "볼링", "밴드", "사진", "베이킹", "댄스", "락 밴드", "돌 수집", "종이접기", "누워있기", "파쿠르", "번지점프", "저글링", "미식축구"]
    
    
    var results: [String] {
        if searchingFor.isEmpty {
            return hobbies
        } else {
            return hobbies.filter { $0.contains(searchingFor)}
        }
    }
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    VStack {
                        Text("내가 선택한 취미")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 5)
                        
                        if select.isEmpty {
                            Text("선택한 취미가 없습니다.")
                                .font(.system(size: 12))
                                .foregroundColor(Color(red: 0.47265625, green: 0.47265625, blue: 0.47265625))
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 5)
                                .padding(.top)
                            
                        } else {
                            FlowLayout(mode: .scrollable,
                                       items: select,
                                       itemSpacing: 4) {
                                let name = $0
                                
                                Button(action: {
                                    select = select.filter { $0 != name }
                                }) {
                                    Text(name)
                                        .font(.system(size: 12))
                                        .foregroundColor(Color.white)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 50)
                                            .foregroundColor(Color.black))
                                }
                            }.padding(.top)
                        }
                    }.padding()
                    
                    VStack {
                        
                        Text("가장 많이 찾는 취미")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 5)
                        
                        FlowLayout(mode: .scrollable,
                                   items: favorite,
                                   itemSpacing: 4) {
                            let name = $0
                            
                            Button(action: {
                                select.append(name)
                            }) {
                                Text(name)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(red: 0.47265625, green: 0.47265625, blue: 0.47265625))
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 50)
                                        .foregroundColor(Color(red: 0.84375, green: 0.84375, blue: 0.84375)))
                            }
                        }.padding(.top)
                        
                    }.padding()
                    
                    VStack {
                        
                        Text("희귀한 나만의 취미")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 5)
                        
                        FlowLayout(mode: .scrollable,
                                   items: rare,
                                   itemSpacing: 4) {
                            let name = $0
                            
                            Button(action: {
                                select.append(name)
                            }) {
                                Text(name)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(red: 0.47265625, green: 0.47265625, blue: 0.47265625))
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 50)
                                        .foregroundColor(Color(red: 0.84375, green: 0.84375, blue: 0.84375)))
                            }
                        }.padding(.top)
                        NavigationLink(destination: MapView(member: members[0]), label: {
                            Text("완료")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 360, height: 50)
                                .background(Color.blue)
                                .clipShape(Capsule())
                                .padding()
                        }).padding(.top,30)
                        
                    }.padding()
                    Spacer()
                    
                }
                .padding(.top, -4)
                .searchable(text: $searchingFor, prompt: "Hobby Search", suggestions : {
                    ForEach(results, id: \.self) { hobby in
                        Text(hobby)
                            .padding(.leading)
                    }
                })
            }
            
            .padding(.top,3)
            .padding(.leading,5)
            
            
        }
        .navigationTitle("취미 선택")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct HobbySelectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HobbySelectView()
        }
        
    }
}

