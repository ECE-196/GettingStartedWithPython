//
//  Intermission.swift
//  GettingStartedWithPython
//
//  Created by Adin Ackerman on 1/16/23.
//

import SwiftUI

class Intermission: SlideModel {
    let name: String = "Intermission"
    let duration: CGFloat = 1
    
    @Published fileprivate var doAnimation: Bool = false
    
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    @Published fileprivate var counter = -1
    
    let tips: [String] = [
        "VSCode has lots of useful extensions. You should use them.",
        "You can accept command line arguments in your Python programs.",
        "It is possible to make GUIs with Python.",
        "Python doesn't have switch statements, but it does have a match statement.",
        "Python generators are a great way to do efficient iteration.",
        "Read the documentation.",
        "Veteran Python developers refer to themselves as \"Pythonistas\".",
        "It is standard practice to use snake case with Python... for obvious reasons.",
        "Anyone who tells you they know how metaclasses work is lying.",
        "Dunder means \"double underscore\"."
    ]
    
    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            IntermissionView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct IntermissionView: SlideView {
    @EnvironmentObject var model: Intermission
    
    var t: CGFloat
    var scale: CGFloat
    
    var body: some View {
        ZStack {
            Group {
                ZStack {
                    Image("python_blue")
                        .resizable()
                        .frame(width: 1000 * scale, height: 1000 * scale)
                        .rotationEffect(.degrees(model.doAnimation ? 0 : -360))
                    
                    Image("python_orange")
                        .resizable()
                        .frame(width: 1000 * scale, height: 1000 * scale)
                        .rotationEffect(.degrees(model.doAnimation ? 0 : -360))
                }
            }
            .opacity(0.2)
            .blur(radius: 20 * scale)
            
            VStack {
                Text("**We will be coming around helping you.**")
                    .font(.system(size: 100 * scale))
                    .padding()
                
                if model.counter % 2 == 0 {
                    HStack {
                        Image(systemName: "lightbulb.fill")
                            .font(.system(size: 50 * scale))
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.yellow, .primary)
                        
                        Text("*\(model.tips[model.counter / 2])*")
                            .font(.system(size: 50 * scale))
                            .fontWeight(.light)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .animation(.linear(duration: 30).repeatForever(autoreverses: false), value: model.doAnimation)
        .onReceive(model.timer) { time in
            withAnimation {
                if model.counter / 2 == model.tips.count - 1 {
                    model.counter = -1
                } else {
                    model.counter += 1
                }
            }
        }
        .onAppear {
            model.doAnimation = true
        }
    }
}
