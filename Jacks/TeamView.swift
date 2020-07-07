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

    var body: some View {
        VStack {
            Text("\(team.list[self.position])")
            Text("Bid \(self.bid)")
            Text("Tricks \(self.tricks)")
            Text("Score \(team.score[self.position])")
        }
        .padding(10)
        .background(Color.purple)
        .cornerRadius(15)
        .opacity(0.5)
    }
   
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView(position: 0, bid: 0, tricks: 0, score: 0).environmentObject(TeamList()).environmentObject(PlayerList())
    }
}
