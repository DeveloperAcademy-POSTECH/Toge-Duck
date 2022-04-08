//
//  RegisterView.swift
//  togeduck
//
//  Created by Yoonjae on 2022/04/08.
//

import SwiftUI

struct RegisterView: View {
    var ages = ["10대 초반", "10대 중반", "10대 후반", "20대 초반", "20대 중반", "20대 후반", "30대 초반", "30대 중반", "30대 후반"]
    var genderType = ["남성","여성"]
    @State var idInput : String = ""
    @State var passwordInput : String = ""
    @State var checkPasswordInput : String = ""
    @State var nickInput : String = ""
    @State var ageInput : String = ""
    @State var idShowAlert = false
    @State var nickShowAlert = false
    @State var selectedAge = 0
    @State var gender = 0
    @State var isNavigationLinkActive = false
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    //아이디 생성 부분
                    VStack(alignment: .leading, spacing: 3, content: {
                        Text("아이디")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        HStack {
                            TextField("아이디를 입력하세요",text: $idInput).keyboardType(.emailAddress)
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.top,10)
                            Button{
                                idShowAlert = true
                            } label: {
                                Text("중복확인")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 80, height: 40)
                                    .background(Color.gray)
                                    .clipShape(Rectangle())
                            }
                            .alert("유효한 아이디입니다.",isPresented: $idShowAlert) {
                            }
                        }
                        
                        Divider().frame(width:270)
                    })
                    .padding(.top,-70)
                    //비밀번호 입력 부분
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("비밀번호")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        SecureField("비밀번호를 입력하세요",text: $passwordInput)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.top,10)
                        Divider()
                    })
                    .padding(.top,30)
                    //비밀번호입력 부분
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("비밀번호확인")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        SecureField("비밀번호를 한번 더 입력하세요",text: $checkPasswordInput).keyboardType(.default)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.top,10)
                        Divider()
                    })
                    .padding(.top,35)
                    //닉네임 입력 부분
                    VStack(alignment: .leading, spacing: 3, content: {
                        Text("닉네임")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        HStack {
                            TextField("닉네임을 입력하세요",text: $nickInput)
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.top,10)
                            Button{
                                nickShowAlert = true
                            } label: {
                                Text("중복확인")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 80, height: 40)
                                    .background(Color.gray)
                                    .clipShape(Rectangle())
                            }
                            .alert("유효한 닉네임입니다.",isPresented: $nickShowAlert) {
                                
                            }
                        }
                        
                        Divider().frame(width:260)
                    })
                    .padding(.top,35)
                    //나이, 성별 입력
                    
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("나이")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        HStack{
                            Picker(selection: $selectedAge, label: Text("연령대를 고르세요.")) {
                                ForEach(0..<ages.count) {
                                    Text(self.ages[$0])
                                }
                            }
                            .foregroundColor(.black)
                            
                        
                            Spacer(minLength: 200)
                            
                            Section(header: Text("")){
                                Picker("성별",selection: $gender) {
                                    ForEach(0..<2) {
                                        Text("\(self.genderType[$0])")
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                                
                            }
                        }
                        
                        
                        Divider().frame(width: 100)
                    })
                    .padding(.top,35)
                    //다음으로 넘어가는 버튼
                    NavigationLink(destination: HobbySelectView(), label: {
                        Text("다음")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(Color.blue)
                            .clipShape(Capsule())
                            .padding()
                        
                    })
                    
                    .padding(.top,50)
                }
                .padding()
                
            }
        }
        .navigationTitle("회원가입")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

