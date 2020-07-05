////
////  Player.swift
////  Spades Scoring
////
////  Created by Isaac Lyons on 6/26/20.
////  Copyright © 2020 Blizzard Skeleton. All rights reserved.
////
//
//import SwiftUI
//
//struct PlayerView: View {
//    @Binding var highlight:Color
//    @Binding var name:String
//    @Binding var bid:Int
//    @Binding var tricks:Int
//    
//    var body: some View {
//        VStack {
//            Text(name)
//            Text("Bid \(bid)")
//            Text("Tricks \(tricks)")
//        }
//        .padding(10)
//        .background(highlight)
//        .cornerRadius(15)
//        .opacity(0.5)
//        .padding()
//    }
//}
//
//struct PlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerView(highlight: Binding.constant(Color.green), name: Binding.constant("Isaac"), bid: Binding.constant(3), tricks: Binding.constant(4))
//    }
//}
