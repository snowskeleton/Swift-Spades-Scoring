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
    @State private var showMistake = false

    var body: some View {
        VStack {
            TopMenuView()
            //Begin players
            VStack {
                
                Spacer()
                
                PlayerView(position: 2, distance: self.team.score[1] - self.team.score[0])
                
                Spacer()
                
                HStack {
                    PlayerView(position: 1, distance: self.team.score[0] - self.team.score[1])
                    Spacer()
                    PlayerView(position: 3, distance: self.team.score[0] - self.team.score[1])
                }.padding()
                
                Spacer()
                
                PlayerView(position: 0, distance: self.team.score[1] - self.team.score[0])
                
                Spacer()
                //End players

                HStack {
                    TeamView(position: 0,
                             bid: self.player.bids[0] + self.player.bids[2],
                             tricks: self.player.tricks[0] + self.player.tricks[2],
                             score: self.team.score[0],
                             bags: self.team.bags[0])
                    
                    Spacer()
                    
                    TeamView(position: 1,
                             bid: self.player.bids[1] + self.player.bids[3],
                             tricks: self.player.tricks[1] + self.player.tricks[3],
                             score: self.team.score[1],
                             bags: self.team.bags[1])
                }.padding()
                
                Spacer()
                
                Button(action: {
                    if self.player.tricks.reduce(0, +) == 13 {
                        _ = self.teamMath(
                            p1Bid: self.player.bids[0],
                            p2Bid: self.player.bids[2],
                            p1Tricks: self.player.tricks[0],
                            p2Tricks: self.player.tricks[2],
                            p1Blind: self.player.blind[0],
                            p2Blind: self.player.blind[2],
                            teamNumber: 0,
                            score: &self.team.score[0])
                        
                        _ = self.teamMath(
                            p1Bid: self.player.bids[1],
                            p2Bid: self.player.bids[3],
                            p1Tricks: self.player.tricks[1],
                            p2Tricks: self.player.tricks[3],
                            p1Blind: self.player.blind[1],
                            p2Blind: self.player.blind[3],
                            teamNumber: 1,
                            score: &self.team.score[1])
                        
                        self.player.rotateDealer()
                        self.player.bids = self.player.bids.map({_ in 0})
                        self.player.tricks = self.player.tricks.map({_ in 0})
                        self.player.blind = self.player.blind.map({_ in false})
                    } else {
                        self.showMistake = true
                    }
                    

                }) {
                    Text("Next Hand")
                        .bold()
                        .padding()
                }
                .alert(isPresented: $showMistake) {
                Alert(title: Text("Whoops!"), message: Text("You did the math wrong"), dismissButton: .default(Text("Okay")))
                }
            }

        }
        
    }
    
    func teamMath(p1Bid: Int, p2Bid: Int, p1Tricks: Int, p2Tricks: Int, p1Blind: Bool, p2Blind: Bool, teamNumber: Int, score: inout Int) -> Void {
        let totalBid = p1Bid + p2Bid
        let totalTricks = p1Tricks + p2Tricks

        //nil bids
        if p1Bid == 0 {
            if p1Tricks == 0 {
                score += (p1Blind == true ? 100 : 50)
            } else {
                score -= (p1Blind == true ? 100 : 50)
            }
        }
        if p2Bid == 0 {
            if p2Tricks == 0 {
                score += (p2Blind == true ? 100 : 50)
            } else {
                score -= (p2Blind == true ? 100 : 50)
            }
        }
        //
        if totalTricks >= totalBid {
            score += (totalTricks * 10) + (totalTricks - totalBid)
        } else {
            score -= totalBid * 10
        }
        
        if totalTricks > totalBid {
            self.team.bags[teamNumber] += totalTricks - totalBid
        }

        if self.team.bags[teamNumber] >= 10 {
            score -= 100
            score -= score % 10
            self.team.bags[teamNumber] = 0
        }
    }
    

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PlayerList()).environmentObject(TeamList())
    }
}

