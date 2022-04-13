//
//  togeduckApp.swift
//  togeduck
//
//  Created by YejiMac on 2022/04/06.
//

import SwiftUI
import Firebase

@main
struct togeduckApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {

//             MainView(cards: MainCardData.sampleData)
          
            let viewModel = AppViewModel()
            ContentView()
                .environmentObject(viewModel)

        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate  {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions :
                     [UIApplication.LaunchOptionsKey : Any]? = nil) ->Bool {
        FirebaseApp.configure()
        
        return true
    }
}
