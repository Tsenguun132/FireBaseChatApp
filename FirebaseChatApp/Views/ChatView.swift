//
//  ChatView.swift
//  FirebaseChatApp
//
//  Created by Tsenguun on 25/7/22.
//

import SwiftUI

struct ChatView: View {
    
    @State var newMessageInput = ""
    @StateObject var chatController = ChatController()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollViewReader { scrollView in
                    ScrollView {
                        ForEach(chatController.messages, id: \.messageID) { message in
                            ChatRow(message: message)
                                .id(chatController.messages.firstIndex(of: message))
                        }
                        .onAppear {
                            scrollView.scrollTo(chatController.messages.count - 1)
                        }
                    }
                }
                Spacer()
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(red: 242/255, green: 243/255, blue: 244/255))
                        .padding()
                    
                    HStack {
                        TextField("Type here...", text: $newMessageInput)
                            .onSubmit {
                                guard !newMessageInput.isEmpty else {
                                    print("New message input is empty")
                                    return
                                }
                                chatController.sendMessage(messageText: newMessageInput)
                                newMessageInput = ""
                            }
                            .padding(30)
                        Button {
                            guard !newMessageInput.isEmpty else {
                                print("New message input is empty")
                                return
                            }
                            chatController.sendMessage(messageText: newMessageInput)
                            newMessageInput = ""
                        } label: {
                            Image(systemName: "paperplane")
                                .imageScale(.large)
                                .padding(30)
                        }
                    }
                }
                .frame(height: 80)
                .cornerRadius(20)
            }
            .background(Color(red: 242/255, green: 243/255, blue: 244/255))
            .navigationTitle("Chatting with ...")
            .onAppear {
                chatController.receiveMessages()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

//        .background(Color(red: 225/255, green: 217/255, blue: 209/255))
//                    .background(RoundedCorners(color: .blue, tl: 50, tr: 20, bl: 0, br: 0))
