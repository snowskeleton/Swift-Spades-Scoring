//
//  BidPickerView.swift
//  Jacks
//
//  Created by Isaac Lyons on 6/29/20.
//  Copyright © 2020 Blizzard Skeleton. All rights reserved.
//

import SwiftUI

struct BidPickerView: View {
    @Binding var bid:Int
    
    var body: some View {
        Picker("Bid", selection: $bid) {
            ForEach(0..<14) {
                Text("\($0)")
            }.labelsHidden()
        }
    }
}

struct BidPickerView_Previews: PreviewProvider {
    static var previews: some View {
        BidPickerView(bid: Binding.constant(1))
    }
}
