//  Player.swift
//  Spades Scoring
//
//  Created by Isaac Lyons on 6/26/20.
//  Copyright © 2020 Blizzard Skeleton. All rights reserved.

import SwiftUI

struct PlayerView: View {
    @EnvironmentObject var player: PlayerList
    @EnvironmentObject var team: TeamList
    @GestureState private var longPressTap = false
    
    var position: Int
    var distance: Int
    
    var body: some View {
        
        HStack {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 20, height: 20)
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
            Button(action: {
                if self.distance >= 100 {
                    self.player.blind[self.position].toggle()
                }
            }) {
                VStack {
                    Text("\(player.list[self.position])")
                    HStack {
                        VStack {
                            Text("Bid")
                            Text("\(player.bids[self.position])")
                        }
                        VStack {
                            Text("Tricks")
                            Text("\(player.tricks[self.position])")
                        }
                    }
                }
            }
            .padding(10)
            .background(self.player.blind[self.position] ? Color.red : player.colors[self.position])
            .cornerRadius(15)
            .opacity(0.5)
            
            //            .gesture(
            //                LongPressGesture(minimumDuration: 0.7)
            //                    .onEnded({_ in
            //            if self.distance <= 100 {
            //                self.player.blind[self.position].toggle()
            //            }
            //                    }))
            
            Image(systemName: "plus")
                .resizable()
                .frame(width: 20, height: 20)
                .gesture(
                    TapGesture()
                        .onEnded({
                            self.player.tricks[self.position] += 1
                        })
            )
                .gesture(
                    LongPressGesture(minimumDuration: 0.7)
                        .onEnded({_ in
                            self.player.tricks[self.position] = 0
                        }))
            
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(position: 1, distance: 0).environmentObject(PlayerList())
    }
}
