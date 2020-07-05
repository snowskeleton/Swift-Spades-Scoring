//  AddPlayer.swift
//  Spades Scoring
//
//  Created by Isaac Lyons on 6/25/20.
//  Copyright © 2020 Blizzard Skeleton. All rights reserved.

import SwiftUI

struct AddPlayer: View {
    @EnvironmentObject var player: PlayerList
    @EnvironmentObject var team: TeamList
    @Binding var show: Bool

    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Form {
                        TextField("Player 1", text: $player.list[0])
                            .padding()
                        TextField("Player 2", text: $player.list[1])
                            .padding()
                        
                        TextField("Player 3", text: $player.list[2])
                            .padding()
                        TextField("Player 4", text: $player.list[3])
                            .padding()
                        
                        TextField("Team 1 name", text: $team.list[0])
                            .padding()
                        TextField("Team 2 name", text: $team.list[1])
                            .padding()
                    }
                }
                
                Button(action: {
                    self.show = false
                }) {
                    Text("Save")
                        .bold()
                        .padding()
                }
            }.navigationBarTitle("Add Players")
            
        }
    }
}


struct AddPlayer_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayer(show: Binding.constant(true)).environmentObject(PlayerList()).environmentObject(TeamList())
    }
}
