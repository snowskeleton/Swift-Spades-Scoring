//  ContentView.swift
//  Spades Scoring
//
//  Created by Isaac Lyons on 6/25/20.
//  Copyright © 2020 Blizzard Skeleton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var player: PlayerList
    @State private var showingAlert = false
    @State private var details = false

    var body: some View {
        VStack {
            //Top row
            HStack {
                StartNew()
                
                Spacer()
                Text("Spades")
                    .bold()
                Spacer()
                
                Button(action: {
                    self.details.toggle()
                }) {
                    Text("Details")
                }.padding(.trailing)
            }
            //
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
                
                Button(action: {
                    self.player.rotateDealer()
                    self.player.bids = self.player.bids.map({_ in 0})
                    self.player.tricks = self.player.tricks.map({_ in 0})
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

func rotate(input: inout Array<Color>) -> Array<Color> {
    var array = input
    let last = array.removeLast()
    array.insert(last, at: 0)
    return array
}


struct StartNew: View {
    @EnvironmentObject var player: PlayerList
    @State var startNew = false
    
    
    var body: some View {
        Button(action: {
            self.startNew.toggle()
        }) {
            
            Text("New")
        } .padding(.leading)
            .sheet(isPresented: $startNew) {
                AddPlayer(show: self.$startNew).environmentObject(self.player)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PlayerList())
    }
}
