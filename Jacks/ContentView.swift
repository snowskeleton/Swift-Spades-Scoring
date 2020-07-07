//  ContentView.swift
//  Spades Scoring
//
//  Created by Isaac Lyons on 6/25/20.
//  Copyright © 2020 Blizzard Skeleton. All rights reserved.

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var player: PlayerList
    @EnvironmentObject var team: TeamList
    @State private var showingAlert = false

    var body: some View {
        VStack {
            TopMenuView()
            //Begin players
            VStack {
                
                Spacer()
                
                PlayerView(position: 2)
                
                Spacer()
                
                HStack {
                    PlayerView(position: 1)
                    Spacer()
                    PlayerView(position: 3)
                }.padding()
                
                Spacer()
                
                PlayerView(position: 0)
                
                Spacer()
                
                HStack {
                    TeamView(position: 0,
                             bid: self.player.bids[0] + self.player.bids[2],
                             tricks: self.player.tricks[0] + self.player.tricks[2],
                             score: self.team.score[0])
                    
                    Spacer()
                    
                    TeamView(position: 1,
                             bid: self.player.bids[1] + self.player.bids[3],
                             tricks: self.player.tricks[1] + self.player.tricks[3],
                             score: self.team.score[1])
                }.padding()
                
                Spacer()
                
                Button(action: {
                    self.player.rotateDealer()
                    self.player.bids = self.player.bids.map({_ in 0})
                    self.player.tricks = self.player.tricks.map({_ in 0})
                    self.team.math(position: 0)
                    self.team.math(position: 1)
                }) {
                    Text("Next hand")
                        .bold()
                        .padding()
                }
            }
            //End players
            
        }
        
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PlayerList()).environmentObject(TeamList())
    }
}

