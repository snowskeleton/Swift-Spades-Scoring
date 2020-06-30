//
//  AddPlayer.swift
//  Spades Scoring
//
//  Created by Isaac Lyons on 6/25/20.
//  Copyright © 2020 Blizzard Skeleton. All rights reserved.
//

import SwiftUI

struct AddPlayer: View {
    @Binding var players:Array<String>
    @Binding var show:Bool
    @State var t1name = ""
    @State var t2name = ""
    @State var temp = ["", "", "", ""]
    
    
    var body: some View {
        VStack {
            VStack {
                Form {
                    TextField("Player 1", text: $temp[0])
                        .padding()
                    TextField("Player 3", text: $temp[1])
                        .padding()
                    
                    TextField("Player 3", text: $temp[2])
                        .padding()
                    TextField("Player 4", text: $temp[3])
                        .padding()
                    TextField("Team 1 name", text: $t1name)
                        .padding()
                    TextField("Team 2 name", text: $t2name)
                        .padding()
                }
            }
            
            Button(action: {
                self.players = self.temp
                self.show = false
            }) {
                Text("Button!")
                    .bold()
                    .padding()
            }
            
        }
    }
    
    struct Player {
        var name = ""
        var tricks = 0
    }
    
    //    struct Team {
    //        var players = [Array<Any>]()
    //        var tricks = players.reduce(0) {$0.tricks + $1.tricks}
    
}


struct AddPlayer_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayer(players: Binding.constant(["", "", "", ""]), show: Binding.constant(true))
    }
}
