//
//  AddPlayer.swift
//  Spades Scoring
//
//  Created by Isaac Lyons on 6/25/20.
//  Copyright © 2020 Blizzard Skeleton. All rights reserved.
//

import SwiftUI

struct AddPlayer: View {
    @EnvironmentObject var players: PlayerList
    //    @Binding var show:Bool
    @State var t1name = ""
    @State var t2name = ""
    @State var showContentView = Bool()
    
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Form {
                        TextField("Player 1", text: $players.list[0])
                            .padding()
                        TextField("Player 3", text: $players.list[1])
                            .padding()
                        
                        TextField("Player 3", text: $players.list[2])
                            .padding()
                        TextField("Player 4", text: $players.list[3])
                            .padding()
                        TextField("Team 1 name", text: $t1name)
                            .padding()
                        TextField("Team 2 name", text: $t2name)
                            .padding()
                    }
                }
                NavigationLink(destination: ContentView(), isActive: $showContentView) { EmptyView() }
                
                Button(action: {
                    self.showContentView = true
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
        AddPlayer().environmentObject(PlayerList())
    }
}
