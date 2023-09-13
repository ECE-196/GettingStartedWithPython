//
//  Setup.swift
//  GettingStartedWithPython
//
//  Created by Adin Ackerman on 1/16/23.
//

import SwiftUI

class Setup: SlideModel {
    let name: String = "Setup"
    let duration: CGFloat = 6

    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            SetupView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct SetupView: SlideView {
    @EnvironmentObject var model: Setup
    
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
            
            if t <= 1 {
                ZStack {
                    Text("Setup")
                        .font(.system(size: 150 * scale))
                        .bold()
                        .scaleEffect(t == 1 ? 1 : 0)
                    
                    Image("python_blue")
                        .resizable()
                        .frame(width: (t < 2 ? 1000 : 500) * scale, height: (t < 2 ? 1000 : 500) * scale)
                        .offset(x: t == 1 ? -100 * scale : 0, y: t == 1 ? -175 * scale : 0)
                    
                    Image("python_orange")
                        .resizable()
                        .frame(width: (t < 2 ? 1000 : 500) * scale, height: (t < 2 ? 1000 : 500) * scale)
                        .offset(x: t == 1 ? 100 * scale : 0, y: t == 1 ? 175 * scale : 0)
                }
            }

            VStack {
                if t <= 3 {
                    Text("Google *\"Download VSCode\"*")
                        .font(.system(size: 100 * scale))
                        .padding()
                    
                    Image("download_vscode")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 1500 * scale)
                        .padding()
                } else if t == 4 {
                    Text("Install Python Extension")
                        .font(.system(size: 100 * scale))
                        .padding()
                    
                    Image("python_extension")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 1500 * scale)
                        .padding()
                } else if t == 5 {
                    Text("Look for a Python Interpreter")
                        .font(.system(size: 100 * scale))
                        .padding()
                    
                    Image("python_interpreter")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 1500 * scale)
                        .padding()
                    
                    HStack {
                        Text("You can access this menu by pressing")
                            .font(.system(size: 50 * scale))
                            .fontWeight(.light)
                        
                        Image(systemName: "command")
                            .font(.system(size: 50 * scale))
                        Image(systemName: "shift")
                            .font(.system(size: 50 * scale))
                        Image(systemName: "p.square")
                            .font(.system(size: 50 * scale))
                        
                        Text("(macOS)")
                            .font(.system(size: 50 * scale))
                            .fontWeight(.light)
                        
                        Image(systemName: "control")
                            .font(.system(size: 50 * scale))
                        Image(systemName: "shift")
                            .font(.system(size: 50 * scale))
                        Image(systemName: "p.square")
                            .font(.system(size: 50 * scale))
                        
                        Text("(Windows) and typing *\"select interpreter\"*.")
                            .font(.system(size: 50 * scale))
                            .fontWeight(.light)
                    }
                }
            }
            .offset(y: t >= 3 ? 0 : 100 * scale)
            .opacity(t >= 3 ? 1 : 0)
            
            if t > 1 {
                HStack {
                    VStack(alignment: .leading) {
                        Image("vscode")
                            .resizable()
                            .frame(width: (t < 3 ? 1000 : 500) * scale, height: (t < 3 ? 1000 : 500) * scale)
                            .offset(x: t == 1 ? -100 * scale : 0, y: t == 1 ? -175 * scale : 0)
                            .padding(200 * scale)
                        
                        if t > 2 {
                            Spacer()
                        }
                    }
                    
                    if t > 2 {
                        Spacer()
                    }
                }
            }
        }
    }
}
