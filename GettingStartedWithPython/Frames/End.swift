//
//  End.swift
//  GettingStartedWithPython
//
//  Created by Adin Ackerman on 1/16/23.
//

import SwiftUI

class End: SlideModel {
    let name: String = "End"
    let duration: CGFloat = 1
    
    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            EndView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct EndView: SlideView {
    @EnvironmentObject var model: End
    
    var t: CGFloat
    var scale: CGFloat
    
    var body: some View {
        Text("Thank you")
            .font(.system(size: 300 * scale))
            .fontWeight(.bold)
            .offset(y: t >= 0 ? 0 : 100 * scale)
            .opacity(t >= 0 ? 1 : 0)
    }
}
