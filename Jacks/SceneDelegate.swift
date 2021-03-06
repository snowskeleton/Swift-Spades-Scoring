//  SceneDelegate.swift
//  Gambling
//
//  Created by Isaac Lyons on 6/23/20.
//  Copyright © 2020 Blizzard Skeleton. All rights reserved.
//

import UIKit
import SwiftUI


class PlayerList: ObservableObject {
    @Published var list = ["", "", "", ""]
    @Published var bids = [0, 0, 0, 0]
    @Published var tricks = [0, 0, 0, 0]
    @Published var blind = [false, false, false, false]
    @Published var colors = [Color.green, Color.blue, Color.blue, Color.blue]
    
    func clear() -> Void {
        self.list = ["", "", "", ""]
    }
    
    func rotateDealer() -> Void {
        let last = colors.removeLast()
        colors.insert(last, at: 0)
    }
}

class TeamList: ObservableObject {
    @Published var list = ["", ""]
    @Published var bids = [0, 0]
    @Published var tricks = [0, 0]
    @Published var bags = [0, 0]
    @Published var score = [0, 0]
    func clear() -> Void {
        self.list = ["", ""]
    }
    func math(position: Int)  -> Void {
           if self.tricks[position] >= self.bids[position] {
               self.score[position] += self.tricks[position] * 10 + (self.tricks[position] - self.bids[position])
           }
           
       }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var players = PlayerList()
    var teams = TeamList()
    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
//        let contentView = ContentView()
//            .environmentObject(players)
//            .environmentObject(teams)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: ContentView().environmentObject(teams).environmentObject(players))
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


struct SceneDelegate_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
