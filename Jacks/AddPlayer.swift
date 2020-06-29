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
    @State var t1name = ""
    @State var t2name = ""

    var body: some View {
        VStack {
            VStack {
                Form {
                    TextField("Player 1", text: $players[0])
                    TextField("Player 3", text: $players[1])

                    TextField("Player 3", text: $players[2])
                    TextField("Player 4", text: $players[3])
                }
                Form {
                    
                    TextField("Team 1 name", text: $t1name)
                    TextField("Team 2 name", text: $t2name)
                }
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
        AddPlayer(players: Binding.constant(["", "", "", ""]))
    }
}
