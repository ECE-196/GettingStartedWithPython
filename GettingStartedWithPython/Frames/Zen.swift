//
//  Zen.swift
//  GettingStartedWithPython
//
//  Created by Adin Ackerman on 1/16/23.
//

import SwiftUI

class Zen: SlideModel {
    let name: String = "Zen"
    let duration: CGFloat = 3
    
    fileprivate let zen = """
    Beautiful is better than ugly.
    Explicit is better than implicit.
    Simple is better than complex.
    Complex is better than complicated.
    Flat is better than nested.
    Sparse is better than dense.
    Readability counts.
    Special cases aren't special enough to break the rules.
    Although practicality beats purity.
    Errors should never pass silently.
    Unless explicitly silenced.
    In the face of ambiguity, refuse the temptation to guess.
    There should be one-- and preferably only one --obvious way to do it.
    Although that way may not be obvious at first unless you're Dutch.
    Now is better than never.
    Although never is often better than *right* now.
    If the implementation is hard to explain, it's a bad idea.
    If the implementation is easy to explain, it may be a good idea.
    Namespaces are one honking great idea -- let's do more of those!
    """
    
    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            ZenView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct ZenView: SlideView {
    @EnvironmentObject var model: Zen
    
    var t: CGFloat
    var scale: CGFloat
    
    var body: some View {
        ZStack {
            VStack {
                Text(t <= 0 ? "What does Python have to offer?" : "The Zen of Python")
                    .font(.system(size: 100 * scale))
                    .fontWeight(.bold)
                    .scaleEffect(t <= 1 ? 1 : 0.5)
                    .padding(.top, t > 1 ? 200 * scale : 0)
                
                if t > 1 {
                    Spacer()
                }
            }
            
            VStack {
                let lines = model.zen.split(separator: "\n")
                ForEach(0..<lines.count, id: \.self) { i in
                    Text(lines[i])
                        .font(.system(size: 50 * scale))
                        .fontWeight(.thin)
                        .padding(2 * scale)
                        .offset(y: t > 1 ? 0 : 100 * scale)
                        .opacity(t > 1 ? 1 : 0)
                        .animation(Presentation.animation.delay(Double(i) * 0.05), value: t)
                }
            }
        }
    }
}
