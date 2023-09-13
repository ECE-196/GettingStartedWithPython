//
//  RealWhy.swift
//  GettingStartedWithPython
//
//  Created by Adin Ackerman on 1/16/23.
//

import SwiftUI
import AVKit

class RealWhy: SlideModel {
    let name: String = "RealWhy"
    let duration: CGFloat = 1
    
    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            RealWhyView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct RealWhyView: SlideView {
    @EnvironmentObject var model: RealWhy
    
    var t: CGFloat
    var scale: CGFloat
    
    @State var player: AVPlayer!
    
    var body: some View {
        ZStack {
            if let player {
                AVPlayerControllerRepresented(player: player)
            } else {
                Text("Error loading video.")
            }
        }
        .onAppear {
            player = AVPlayer(url: createLocalUrl(for: "Blocks2", ofType: "mp4")!)
        }
        .onChange(of: t) { newValue in
            if newValue == 0 {
                player.seek(to: .zero)
                player.play()
            }
        }
    }
}
