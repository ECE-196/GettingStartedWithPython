//
//  OS.swift
//  GettingStartedWithPython
//
//  Created by Adin Ackerman on 1/16/23.
//

import SwiftUI

class OS: SlideModel {
    let name: String = "OS"
    let duration: CGFloat = 2
    
    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            OSView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct OSView: SlideView {
    @EnvironmentObject var data: OS
    
    var t: CGFloat
    var scale: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.1)
                .padding(100 * scale)
            
            Rectangle()
                .stroke(style: StrokeStyle(lineWidth: 8 * scale, dash: [10 * scale, 20 * scale]))
                .foregroundColor(.white)
                .opacity(0.1)
                .padding(100 * scale)
            
            HStack {
                if t <= 0 {
                    Spacer()
                }
                
                Image("windows")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: (t <= 0 ? 500 : 1000) * scale )
                
                if t <= 0 {
                    Spacer()
                    
                    Image("macos")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 500 * scale)
                    
                    Spacer()
                }
            }
        }
    }
}
