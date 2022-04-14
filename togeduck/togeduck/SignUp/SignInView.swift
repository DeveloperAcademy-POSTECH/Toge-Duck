//
//  SignInView.swift
//  togeduck
//
//  Created by Yoonjae on 2022/04/08.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject {
    let auth = Auth.auth()
    @Published var signedIn = false
    var isSignedIn : Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil,error == nil else {
                return
            }
            //성공
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self]  result, error in
            guard result != nil, error == nil else {
                return
            }
            //성공
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
    }
}

struct SignView: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        NavigationView {
            
            if viewModel.signedIn {
                
                    HobbySelectView()
                    
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                viewModel.signOut()
                            }, label: {
                                Text("로그아웃")
                                    .frame(width: 60, height: 30)
                            })
                        }
                    }
            } else {
                SignInView()
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct SignInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        NavigationView {
            ZStack {

                VStack {
                    
                    VStack {
                        
                        Text("투게덕")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.bottom, 20)
                        
                        Text("동네 취미 친구를 사귀어보아요")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.bottom, 20)
                        
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipped()
                            .cornerRadius(150)
                            .padding(.bottom, 75)
                    }
                    
                    VStack(spacing: 20) {
                                                    
                        TextField("email", text: $email)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                            .cornerRadius(10)
                            .padding(.horizontal, 32)
                        

                        SecureField("Password", text: $password)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .padding()
                            .cornerRadius(10)
                            .padding(.horizontal, 32)
                    }
                    
                    HStack {
                        Spacer()
                        NavigationLink(destination: SignUpView(), label: {
                            Text("아이디가 없으신가요?")
                                .font(.system(size: 13, weight: .semibold))
                                .padding(.top)
                                .padding(.trailing, 28)
                        })
                       
                    }
                    
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else{
                            return
                        }
                        viewModel.signIn(email: email, password: password)
                    }, label: {
                        Text("로그인")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(Color.black)
                            .clipShape(Capsule())
                            .padding()
                        Spacer()
                    })
                }
                .padding(.top, -44)
            }
        }
        .navigationTitle("로그인")
    }
}



struct SignUpView: View {
    var ages = ["10대 초반", "10대 중반", "10대 후반", "20대 초반", "20대 중반", "20대 후반", "30대 초반", "30대 중반", "30대 후반"]
    var genderType = ["남성","여성"]
    @State var email : String = ""
    @State var password : String = ""
    @State var checkPasswordInput : String = ""
    @State var nickInput : String = ""
    @State var ageInput : String = ""
    @State var idShowAlert = false
    @State var nickShowAlert = false
    @State var selectedAge = 0
    @State var gender = 0
    @State var isNavigationLinkActive = false
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
            ZStack{
                VStack {
                    //아이디 생성 부분
                    VStack(alignment: .leading, spacing: 3, content: {
                        Text("이메일")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        HStack {
                            TextField("이메일를 입력하세요",text: $email).keyboardType(.emailAddress)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
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
                        SecureField("비밀번호를 입력하세요",text: $password)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
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
                            
                        
                            Spacer(minLength: 160)
                            
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
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else{
                            return
                        }
                        viewModel.signUp(email: email, password: password)
                    }, label: {
                        Text("회원가입")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(Color.blue)
                            .clipShape(Capsule())
                            .padding()
                        Spacer()
                    })
                    
                    .padding(.top,80)
                }
                .padding()
                
            }
            .padding(.top,80)
        .navigationTitle("회원가입")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

