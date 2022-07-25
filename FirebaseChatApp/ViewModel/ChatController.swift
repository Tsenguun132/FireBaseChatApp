//
//  ChatController.swift
//  FirebaseChatApp
//
//  Created by Tsenguun on 26/7/22.
//

import Foundation
import Combine

class ChatController: ObservableObject {
    var messages = [ChatMessage]()
    
    func sendMessage(messageText: String) {
        let newChat = databaseChats.childByAutoId()
        let messageToSend = ["username": UserDefaults.standard.string(forKey: "username") ?? "Unknown User", "messageTextt": messageText]
        newChat.setValue(messageToSend)
    }
    
    func receiveMessages() {
        let query = databaseChats.queryLimited(toLast: 100)
        
        _ = query.observe(.childAdded, with: { [weak self] snapshot in
            if let data = snapshot.value as? [String: String],
               let retrievedUsername = data["username"],
               let retrievedMessageText = data["messageTextt"],
               !retrievedMessageText.isEmpty {
                let retrievedMessage = ChatMessage(messageText: retrievedMessageText, username: retrievedUsername)
                self?.messages.append(retrievedMessage)
                self?.objectWillChange.send()
            }
        })
    }
}

