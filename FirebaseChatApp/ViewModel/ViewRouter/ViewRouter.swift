//
//  ViewRouter.swift
//  FirebaseChatApp
//
//  Created by Tsenguun on 25/7/22.
//

import SwiftUI
import Combine

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .loginView
    
    init(pageToStartWith: Page) {
        currentPage = pageToStartWith
    }
}
