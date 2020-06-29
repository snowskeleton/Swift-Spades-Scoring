//
//  ContentView.swift
//  Spades Scoring
//
//  Created by Isaac Lyons on 6/25/20.
//  Copyright © 2020 Blizzard Skeleton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var players = ["", "", "", ""]
    @State var bids = [0, 0, 0, 0]
    @State var tricks = [0, 0, 0, 0]
    @State var mcolor = [Color.blue, Color.green, Color.blue, Color.blue]
    
    @State var t1name = ""
    @State var t2name = ""
    @State private var showingAlert = false
    //    @State private var showActionSheet = false
    @State private var showingDetail = false
    @State private var startNew = false
    @State private var details = false
    
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.startNew.toggle()
                    self.players = ["", "", "", ""]
                }) {
                    
                    Text("New")
                } .padding(.leading)
                    .sheet(isPresented: $startNew) {
                        AddPlayer(players: self.$players)
                }
                
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
            VStack {
                
                Spacer()
                
                //top
                PlayerView(highlight: $mcolor[2], name: $players[2], bid: $bids[0], tricks: $tricks[0])
                
                Spacer()
                HStack {
                    
                    //left
                    PlayerView(highlight: $mcolor[1], name: $players[1], bid: $bids[1], tricks: $tricks[1])
                    Spacer()
                    //right
                    PlayerView(highlight: $mcolor[3], name: $players[3], bid: $bids[2], tricks: $tricks[2])
                }
                Spacer()
                
                Button(action: {
                    //self.showingAlert.toggle()
                }) {
                    //bottom
                    PlayerView(highlight: $mcolor[0], name: $players[0], bid: $bids[3], tricks: $tricks[3])
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Hello SwiftUI"),
                                  message: Text("This is some text"),
                                  dismissButton: .default(Text("Update")))
                    }
                }
                Spacer()
                
                Button(action: {
                    self.mcolor = rotate(input: &self.mcolor)
                }) {
                    Text("Next Hand")
                    .bold()
                    .padding()
                }
            }
            
        }
        
    }
    
}
func rotate(input: inout Array<Color>) -> Array<Color> {
    var array = input
    let last = array.removeLast()
    array.insert(last, at: 0)
    return array
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
