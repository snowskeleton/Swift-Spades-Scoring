//
//  ContentView.swift
//  Spades Scoring
//
//  Created by Isaac Lyons on 6/25/20.
//  Copyright © 2020 Blizzard Skeleton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var player: PlayerList
//    let player = PlayerList()
    @State private var showingAlert = false
    //    @State private var showActionSheet = false
    @State private var showingDetail = false
    @State private var showPicker = false
    @State private var details = false
    @State private var numberInput = false
    
    var body: some View {
        ZStack {
            //            if numberInput == false {
            //                ZStack {
            //                    Rectangle()
            //                        .background(Color.blue)
            //                        .opacity(0.3)
            //                        //                    .fixedSize(horizontal: true, vertical: true)
            //                        .overlay(TextField("Enter Bid", text: $somevar), alignment: .center)
            //                        .frame(width: 260, height: 180, alignment: .center)
            //                        .cornerRadius(20)
            //                }
            //            }
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
                    
                    PlayerButton(position: 2)
                    
                    Spacer()
                    HStack {
                        
                        PlayerButton(position: 1)
                        Spacer()
                        PlayerButton(position: 3)
                    }
                    Spacer()
                    
                    PlayerButton(position: 0)
                    
                    Spacer()
                    
                    Button(action: {
                        self.player.rotateColor()
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
}

func rotate(input: inout Array<Color>) -> Array<Color> {
    var array = input
    let last = array.removeLast()
    array.insert(last, at: 0)
    return array
}


struct StartNew: View {
    let mplayer = PlayerList()
    @State var startNew = false
    
    
    var body: some View {
        Button(action: {
            self.startNew.toggle()
        }) {
            
            Text("New")
        } .padding(.leading)
            .sheet(isPresented: $startNew) {
                AddPlayer().environmentObject(self.mplayer)
        }
    }
}


struct PlayerButton: View {
    @EnvironmentObject var player: PlayerList
    var position: Int
    
    var body: some View {
        
        Button(action: { }) {
            VStack {
                Text("\(player.list[self.position])")
                Text("Bid \(player.bids[self.position])")
                Text("Tricks \(player.tricks[self.position])")
            }
            .gesture(
                TapGesture()
                    .onEnded({
                        self.player.bids[self.position] += 1
                    })
            )
            .gesture(
                LongPressGesture(minimumDuration: 0.7)
                    .onEnded({_ in 
                        self.player.bids[self.position] = 0
                    }))
            .padding(10)
            .background(player.colors[self.position])
            .cornerRadius(15)
            .opacity(0.5)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PlayerList())
    }
}
