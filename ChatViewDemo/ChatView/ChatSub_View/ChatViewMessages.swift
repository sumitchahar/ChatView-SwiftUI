//
//  ChatViewMessages.swift
//  ChatViewDemo
//
//  Created by Sumit on 08/04/24.
//

import SwiftUI

struct ChatViewMessages: View {
        
   @State var chatViewModel:ChatViewModel
    
    @State var isTyping:Bool = false

    var body: some View {
        HStack {
            if chatViewModel.messagePosition == .right {
                Spacer()
                Text(chatViewModel.rightMessage)
                    //.multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .lineSpacing(4)
                    .padding(.all)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.blue)
                    )
                    .frame(maxWidth: 300, alignment: .trailing)
                    .id(chatViewModel.id)
            } else if chatViewModel.messagePosition == .istyping && chatViewModel.leftMessage == ""  {
                TypingIndicatorView()
                    .padding()
                    .id(chatViewModel.id)
            }
            else {

                Text(chatViewModel.leftMessage)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .lineSpacing(4)
                    .padding(.all)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.gray)
                    )
                    .frame(maxWidth: 300, alignment: .leading)
                    .id(chatViewModel.id)
                     Spacer()
          }
      }
        .padding([.trailing,.leading], 20)
    }
    
}

#Preview {
    ChatViewMessages(chatViewModel: ChatViewMVVM().chatViewModel[0])

}
