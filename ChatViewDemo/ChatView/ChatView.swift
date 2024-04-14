//
//  ChatView.swift
//  ChatViewDemo
//
//  Created by Sumit on 07/04/24.
//

import SwiftUI
import Combine

struct ChatView: View {
    
    @ObservedObject var chatViewMVVM = ChatViewMVVM()
    @FocusState private var nameIsFocused: Bool
    @State var isUserSendMessage: Bool = true
    @State var chatMessageDefault: String = ""
    @State var isUserTyping: Bool = false

    var body: some View {
            
            ZStack {
                VStack {
                    Spacer()
                    DisplayMessageInsideScrollView(viewModel: chatViewMVVM, isTyping:isUserTyping)
                        .padding([.bottom],0)
                    HStack {
                        TextField("Write something for ChatGPT", text: $chatMessageDefault, axis: .vertical)
                            .padding(12)
                            .keyboardType(.default)
                            .background(Color(.systemGray6))
                            .cornerRadius(25)
                            .autocorrectionDisabled()
                            .lineLimit(6)
                            .focused($nameIsFocused)
                            .onChange(of: chatMessageDefault, { _, newMessage in
                                                              
                     if  chatMessageDefault == "" {
                                chatViewMVVM.whenuserTyping(chatMessageDefault, isUserTyping: .none)
                     } else {
                                chatViewMVVM.whenuserTyping(chatMessageDefault, isUserTyping: .istyping)
                            }
                      })
                        Button(action: {
                          if isUserSendMessage {
                            chatViewMVVM.sendMessageFromUserSide(chatMessageDefault)
                              isUserSendMessage.toggle()
                          } else {
                            chatViewMVVM.receiveMessageFromUserSide(chatMessageDefault)
                              isUserSendMessage.toggle()
                          }
                            chatMessageDefault = ""
                            
                        }) {
                            Image(systemName: "paperplane.fill")
                                .foregroundColor(Color.white)
                                .frame(width: 44, height: 44)
                                .background(Color.blue)
                                .cornerRadius(22)
                        }.padding([.trailing], 12)
                        
                    }.padding([.leading,.bottom],15)
                    
                }.animation(.easeInOut, value:0)
            .background( Image("BGD") )
            .onTapGesture(count: 1) {
               nameIsFocused.toggle()
               chatViewMVVM.removelastUserTyping()
            }
        
        }
    }
 }

#Preview {
    ChatView()
}



