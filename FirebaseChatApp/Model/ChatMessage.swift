//
//  File.swift
//  FirebaseChatApp
//
//  Created by Tsenguun on 25/7/22.
//

import Foundation

struct ChatMessage: Hashable {
    let messageText: String
    let username: String
    let isMe: Bool
    let messageID = UUID()
    
    init(messageText: String, username: String) {
        self.messageText = messageText
        self.username = username
        if UserDefaults.standard.string(forKey: "username") == username {
            self.isMe = true
        } else {
            self.isMe = false
        }
    }
}

let sampleConversation = [
    ChatMessage(messageText: "Hello how are you?", username: "Me"),
    ChatMessage(messageText: "I'm fine and you?", username: "Another user"),
    ChatMessage(messageText: "I'm fine as well. Thanks for asking. What are you doing right now?", username: "Me"),
    ChatMessage(messageText: "Do you have any vacation plans coming up?", username: "Another user"),
    ChatMessage(messageText: "I'm thinking about going to Spain", username: "Me"),
    ChatMessage(messageText: "What about you ?🤔", username: "Me"),
    ChatMessage(messageText: "Sounds great!", username: "Another user"),
    ChatMessage(messageText: "Thinking about flying to Sweden for christmas! 🎄", username: "Another user"),
    ChatMessage(messageText: "I would love to go to Sweden one day!", username: "Me")
]
