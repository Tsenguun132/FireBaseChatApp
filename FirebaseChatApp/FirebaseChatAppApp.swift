//
//  FirebaseChatAppApp.swift
//  FirebaseChatApp
//
//  Created by Tsenguun on 25/7/22.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct FirebaseChatAppApp: App {
    @StateObject var viewRouter = ViewRouter(pageToStartWith: UserDefaults.standard.string(forKey: "username") != nil ? .chatView : .loginView)
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewRouter)
        }
    }
}
