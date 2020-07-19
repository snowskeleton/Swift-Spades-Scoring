//  AddPlayer.swift
//  Spades Scoring
//
//  Created by Isaac Lyons on 6/25/20.
//  Copyright © 2020 Blizzard Skeleton. All rights reserved.

import SwiftUI
import Combine

struct AddPlayer: View {
    @EnvironmentObject var player: PlayerList
    @EnvironmentObject var team: TeamList
    @State private var keyboardHeight: CGFloat = 0
    @State private var hideSave = false
    
    @Binding var show: Bool
    
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Form {
                        Section(header: Text("Players")) {
                            TextField("Player 1", text: $player.list[0])
                                .padding()
                            TextField("Player 2", text: $player.list[1])
                                .padding()
                            
                            TextField("Player 3", text: $player.list[2])
                                .padding()
                            TextField("Player 4", text: $player.list[3])
                                .padding()
                        }
                        Section(header: Text("Teams")) {
                            TextField("Team 1 name", text: $team.list[0])
                                .padding()
                            TextField("Team 2 name", text: $team.list[1])
                                .padding()
                        }
                        
                    }
                }.padding(.bottom, keyboardHeight)
                    

                Button(action: {
                    self.player.colors.shuffle()
                    self.show = false
                }) {
                    Text("Save")
                        .bold()
                        .padding()
                }
                
            }.navigationBarTitle("Add Players")
            
        }
        .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
    }
}

struct AddPlayer_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayer(show: Binding.constant(true))
            .environmentObject(PlayerList())
            .environmentObject(TeamList())
    }
}
