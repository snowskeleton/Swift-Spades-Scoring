//
//  TopMenuView.swift
//  Jacks
//
//  Created by Isaac Lyons on 7/5/20.
//  Copyright © 2020 Blizzard Skeleton. All rights reserved.
//

import SwiftUI

struct TopMenuView: View {
        @EnvironmentObject var player: PlayerList
        @EnvironmentObject var team: TeamList
        @State var details = false
        @State var startNew = false


    var body: some View {
        HStack {
            Button(action: {
                self.startNew.toggle()
            }) {
                
                Text("New")
            } .padding(.leading)
                .sheet(isPresented: $startNew) {
                    AddPlayer(show: self.$startNew).environmentObject(self.player).environmentObject(self.team)
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
    }
}


struct TopMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TopMenuView().environmentObject(TeamList()).environmentObject(PlayerList())
    }
}
