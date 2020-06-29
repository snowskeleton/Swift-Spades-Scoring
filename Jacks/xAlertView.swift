////
////  SwiftUIView.swift
////  Jacks
////
////  Created by Isaac Lyons on 6/26/20.
////  Copyright © 2020 Blizzard Skeleton. All rights reserved.
////
//
//import SwiftUI
//
//        struct TextFieldAlert<Presenting>: View where Presenting: View {
//
//            @Binding var isShowing: Bool
//            @Binding var text: String
//            let presenting: Presenting
//            let title: String
//
//            var body: some View {
//                GeometryReader { (deviceSize: GeometryProxy) in
//                    ZStack {
//                        self.presenting
//                            .disabled(self.isShowing)
//                        VStack {
//                            Text(self.title)
//                            TextField("Hello, world", text: self.$text)
//                            Divider()
//                            HStack {
//                                Button(action: {
//                                    withAnimation {
//                                        self.isShowing.toggle()
//                                    }
//                                }) {
//                                    Text("Dismiss")
//                                }
//                            }
//                        }
//                        .padding()
//                        .background(Color.white)
//                        .frame(
//                            width: deviceSize.size.width*0.7,
//                            height: deviceSize.size.height*0.7
//                        )
//                        .shadow(radius: 1)
//                        .opacity(self.isShowing ? 1 : 0)
//                    }
//
//        }
//    }
//}
//
//struct TextFieldAlert_Previews: PreviewProvider {
//    static var previews: some View {
//        TextFieldAlert(isShowing: Binding.constant(true), text: Binding.constant(View.String("Love me?")), presenting: "This?", title: "Help me")
//    }
//}
