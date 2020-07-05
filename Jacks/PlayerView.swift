////
////  Player.swift
////  Spades Scoring
////
////  Created by Isaac Lyons on 6/26/20.
////  Copyright © 2020 Blizzard Skeleton. All rights reserved.
////
//
import SwiftUI
//
struct PlayerView: View {
    @EnvironmentObject var player: PlayerList
    var position: Int
    
    var body: some View {
        
        Button(action: { }) {
            VStack {
                Text("\(player.list[self.position])")
                Text("Bid \(player.bids[self.position])")
                Text("Tricks \(player.tricks[self.position])")
            }
            .padding(10)
            .background(player.colors[self.position])
            .cornerRadius(15)
            .opacity(0.5)
            .gesture(
                TapGesture()
                    .onEnded({
                        self.player.bids[self.position] += 1
                    })
            )
            .gesture(
                LongPressGesture(minimumDuration: 0.7)
                    .onEnded({_ in
                        self.player.bids[self.position] = 0
                    }))
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(position: 1).environmentObject(PlayerList())
    }
}