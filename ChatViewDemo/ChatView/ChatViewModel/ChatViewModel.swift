//
//  ChatViewModel.swift
//  ChatViewDemo
//
//  Created by Sumit on 08/04/24.
//

 import Foundation




 enum MessagePosition {
     case left
     case right
     case istyping
     case none
 }

struct ChatViewModel:Identifiable,Hashable {
     let id = UUID()
     var leftMessage:String
     var rightMessage:String
     var messagePosition:MessagePosition = .none
 }







