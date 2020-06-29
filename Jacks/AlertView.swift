////
////  SimpleAlertView.swift
////  Jacks
////
////  Created by Isaac Lyons on 6/27/20.
////  Copyright © 2020 Blizzard Skeleton. All rights reserved.
////
//
//import SwiftUI
//
//struct Alert: View {
//    
//    @Binding var titleVar:String
//    @Binding var messageVar:String
//    @Binding var dismissMessage:String
//    
//    var body: some View {
//        VStack {
//            Alert(title: Text(titleVar), message: Text(messageVar), dismissButton: .default(Text(dismissMessage)))
//        }
//    }
//}
//
//
//struct Alert_Previews: PreviewProvider {
//    static var previews: some View {
//        Alert(titleVar: Binding.constant("You should be careful"), messageVar: Binding.constant("Do you understand?"), dismissMessage: Binding.constant("Okay, okay"))
//    }
//}
