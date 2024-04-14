//
//  ChatViewMVVM.swift
//  ChatViewDemo
//
//  Created by Sumit on 08/04/24.
//

import Foundation
import Observation

class ChatViewMVVM:ObservableObject {
    
    @Published  var chatViewModel:[ChatViewModel] = {
         return [ChatViewModel(leftMessage: "All of the associated values for an enumeration case are extracted as constants, or if all are extracted as variables, you can place a single", rightMessage: "",messagePosition:.left)]
        }()
    
    
    
    func sendMessageFromUserSide(_ message:String) {
           dataMigurationflectionCondition()
           chatViewModel.append(ChatViewModel(leftMessage: "", rightMessage: message,messagePosition:.right))
    }
    
    func receiveMessageFromUserSide(_ message:String) {
           dataMigurationflectionCondition()
           chatViewModel.append(ChatViewModel(leftMessage: message, rightMessage: "",messagePosition:.left))
    }
    
    func whenuserTyping(_ message:String, isUserTyping:MessagePosition) {
        
        if message.isEmpty && isUserTyping == .none {
           let data = chatViewModel.last
            if data?.leftMessage == ""  && data?.rightMessage == ""  && data?.messagePosition != isUserTyping {
                chatViewModel.removeLast()
            }  else { }
        } else if message != "" {
            let data = chatViewModel.last
            if data?.leftMessage != "" && data?.messagePosition != isUserTyping {
                chatViewModel.append(ChatViewModel(leftMessage: "", rightMessage: "",messagePosition:isUserTyping))
            } else if data?.rightMessage != "" && data?.messagePosition != isUserTyping {
                 chatViewModel.append(ChatViewModel(leftMessage: "", rightMessage: "",messagePosition:isUserTyping))
            } else if message == "" && MessagePosition.istyping ==  isUserTyping {
                 removelastUserTyping()
            } else { }
        }
  }

    func removelastUserTyping() { dataMigurationflectionCondition() }
    
  }
 
extension ChatViewMVVM {
    
    private func dataMigurationflectionCondition() {
          let data = chatViewModel.last
           if data?.leftMessage == "" && data?.messagePosition == MessagePosition.istyping {
              chatViewModel.removeLast()
         } else if data?.rightMessage != "" && data?.messagePosition == MessagePosition.istyping {
              chatViewModel.removeLast()
         } else { }
      }
      
   }
