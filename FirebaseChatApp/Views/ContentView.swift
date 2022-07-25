//
//  ContentView.swift
//  FirebaseChatApp
//
//  Created by Tsenguun on 25/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .loginView:
            LoginView()
        case .chatView:
            ChatView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter(pageToStartWith: .loginView))
    }
}
