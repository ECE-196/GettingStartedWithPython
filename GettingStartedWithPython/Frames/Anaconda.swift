//
//  Anaconda.swift
//  GettingStartedWithPython
//
//  Created by Adin Ackerman on 1/16/23.
//

import SwiftUI

class Anaconda: SlideModel {
    let name: String = "Anaconda"
    let duration: CGFloat = 3
    
    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            AnacondaView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct AnacondaView: SlideView {
    @EnvironmentObject var data: Anaconda
    
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
            
            VStack {
                if t <= 1 {
                    Text("Google *\"Download Anaconda\"*")
                        .font(.system(size: 100 * scale))
                        .padding()
                    
                    Image("download_anaconda")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 1500 * scale)
                        .padding()
                } else if t == 2 {
                    Text("Follow wizard and leave all options as default.")
                        .font(.system(size: 100 * scale))
                        .padding()
                }
            }
            .offset(y: t >= 1 ? 0 : 100 * scale)
            .opacity(t >= 1 ? 1 : 0)
            
            if t >= 0 {
                HStack {
                    VStack(alignment: .leading) {
                        Image("anaconda")
                            .resizable()
                            .frame(width: (t < 1 ? 1000 : 500) * scale, height: (t < 1 ? 1000 : 500) * scale)
                            .padding(200 * scale)
                        
                        if t > 0 {
                            Spacer()
                        }
                    }
                    
                    if t > 0 {
                        Spacer()
                    }
                }
            }
        }
    }
}
