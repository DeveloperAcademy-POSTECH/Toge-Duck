//
//  SignInView.swift
//  togeduck
//
//  Created by Yoonjae on 2022/04/08.
//

import SwiftUI

struct SignInView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
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
                                                    
                        TextField("Username", text: $username)
                            .padding()
                            .cornerRadius(10)
                            .padding(.horizontal, 32)
                        

                        SecureField("Password", text: $password)
                            .padding()
                            .cornerRadius(10)
                            .padding(.horizontal, 32)
                    }
                    
                    HStack {
                        Spacer()
                        NavigationLink(destination: RegisterView(), label: {
                            Text("아이디가 없으신가요?")
                                .font(.system(size: 13, weight: .semibold))
                                .padding(.top)
                                .padding(.trailing, 28)
                        })
                       
                    }
                    
                    NavigationLink(destination: HobbySelectView(), label: {
                        Text("로그인")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(Color.blue)
                            .clipShape(Capsule())
                            .padding()
                        Spacer()
                    })
                    
                }
                .padding(.top, -44)
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

