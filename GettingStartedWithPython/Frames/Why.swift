//
//  Why.swift
//  GettingStartedWithPython
//
//  Created by Adin Ackerman on 1/13/23.
//

import SwiftUI

class Why: SlideModel {
    let name: String = "Why"
    let duration: CGFloat = 7
    
    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            WhyView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct WhyView: SlideView {
    @EnvironmentObject var model: Why
    
    var t: CGFloat
    var scale: CGFloat
    
    var body: some View {
        ZStack {
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
                    VStack(alignment: .leading) {
                        ZStack {
                            Text("Why?")
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
                        .animation(Presentation.animation, value: t)
                        .padding(200 * scale)
                        
                        Group {
                            if t > 2 {
                                Text("• Easy")
                                    .font(.system(size: 150 * scale))
                            }
                            
                            if t > 3 {
                                Text("• Lots of libraries")
                                    .font(.system(size: 150 * scale))
                            }
                            
                            if t > 4 {
                                Text("• Machine learning")
                                    .font(.system(size: 150 * scale))
                            }
                        }
                        .padding(.leading, 200 * scale)
                        
                        if t > 1 {
                            Spacer()
                        }
                    }
                    
                    if t > 1 {
                        Spacer()
                    }
                }
            }
            .scaleEffect(t > 5 ? 0.8 : 1)
            .saturation(t > 5 ? 0.2 : 1)
            .opacity(t > 5 ? 0.5 : 1)
            
            Image(systemName: "xmark")
                .font(.system(size: 1500 * scale))
                .foregroundColor(.red)
                .scaleEffect(t > 5 ? 1 : 1.5)
                .opacity(t > 5 ? 1 : 0)
        }
    }
}
