//  TeamView.swift
//  Jacks
//
//  Created by Isaac Lyons on 7/5/20.
//  Copyright © 2020 Blizzard Skeleton. All rights reserved.

import SwiftUI

struct TeamView: View {
    @EnvironmentObject var player: PlayerList
    @EnvironmentObject var team: TeamList
    var position: Int
    var bid: Int
    var tricks: Int
    var score: Int
    var bags: Int
   
    var body: some View {
        VStack {
            Text("\(team.list[self.position])")
            HStack {
                VStack {
                    Text("Bid")
                    Text("\(self.bid)")
                    Text("Tricks")
                    Text("\(self.tricks)")
                }
                VStack {
                    Text("Score")
                    Text("\(score)")
                    Text("Bags")
                    Text("\(bags)")
                }
            }
        }
        .padding(10)
        .background(Color.purple)
        .cornerRadius(15)
        .opacity(0.5)
    }
    
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView(position: 0, bid: 0, tricks: 0, score: 0, bags: 0).environmentObject(TeamList()).environmentObject(PlayerList())
    }
}
