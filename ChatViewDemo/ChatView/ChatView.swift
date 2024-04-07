//
//  ChatView.swift
//  ChatViewDemo
//
//  Created by Sumit on 07/04/24.
//

import SwiftUI

struct ChatView: View {
    
    @State var prompt: String = ""
    @FocusState private var nameIsFocused: Bool

    var body: some View {
        
     ZStack {
       
         VStack {

            Spacer()
            HStack {
                TextField("Write something for ChatGPT", text: $prompt, axis: .vertical)
                    .padding(12)
                    .keyboardType(.default)
                    .background(Color(.systemGray6))
                    .cornerRadius(25)
                    .autocorrectionDisabled()
                    .lineLimit(6)
                    .onSubmit { }
                    .focused($nameIsFocused)

                Button(action: {
                    Task { prompt = "" }
                }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(Color.white)
                        .frame(width: 44, height: 44)
                        .background(Color.blue)
                        .cornerRadius(22)
                }.padding([.trailing], 12)
            }.padding([.leading,.bottom],12)
        }.animation(.easeInOut, value: 0)

     }.background(
        Image("BGD")
     )
     
        
     .onTapGesture(count: 1) {
           nameIsFocused.toggle()
        }
      
        
    }
    
 }

#Preview {
    ChatView()
}
