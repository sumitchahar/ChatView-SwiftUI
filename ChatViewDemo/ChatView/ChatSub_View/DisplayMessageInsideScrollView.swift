//
//  DisplayMessageInsideScrollView.swift
//  ChatViewDemo
//
//  Created by Sumit on 08/04/24.
//

import SwiftUI

struct DisplayMessageInsideScrollView: View {
    
    @State var height: CGFloat = 0
    @State var keyboard: Bool = false
    
    @ObservedObject var viewModel: ChatViewMVVM
    
    @State var isTyping:Bool = false

    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView {
                ForEach(viewModel.chatViewModel) { chatViewModel in
                       ChatViewMessages(chatViewModel: chatViewModel)
                }
            }.scrollIndicators(.hidden)
             .defaultScrollAnchor(.top)
             .onChange(of: viewModel.chatViewModel, perform: { newMessage in
                withAnimation(.linear(duration: 0.5)) { scrollProxy.scrollTo(newMessage.last?.id, anchor: .bottom) }
            })

            .onAppear { withAnimation { scrollProxy.scrollTo(viewModel.chatViewModel.last?.id, anchor: .bottom) } }
        } .onChange(of: isTyping, perform: { newMessage in
            withAnimation(.linear(duration: 0.5)) {
               // scrollProxy.scrollTo(newMessage.last?.id, anchor: .bottom)
            }
        })
    }
    
}

//#Preview {
//    DisplayMessageInsideScrollView(viewModel: .constant(.init()))
//}
