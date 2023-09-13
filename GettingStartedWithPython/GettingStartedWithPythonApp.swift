//
//  GettingStartedWithPythonApp.swift
//  GettingStartedWithPython
//
//  Created by Adin Ackerman on 1/13/23.
//

import SwiftUI

@main
struct GettingStartedWithPythonApp: App {
    @StateObject var model = Presentation(slides: [
        Loading(),
        Title(),
        Why(),
//        RealWhy(),
        Zen(),
        Setup(),
        Intermission(),
        Anaconda(),
        OS(),
        Intermission(),
        SwiftIntro(),
        End()
    ])
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
        .commands {
            CommandMenu("Control") {
                Text("Current frame: \(Int(model.keyframe))")
                
                Button("Next Keyframe") {
                    model.nextKeyframe()
                }
                .keyboardShortcut("N")
                
                Button("Previous Keyframe") {
                    model.prevKeyFrame()
                }
                .keyboardShortcut("B")
            }
        }
    }
}
