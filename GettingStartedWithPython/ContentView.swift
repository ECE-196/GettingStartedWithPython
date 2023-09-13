//
//  ContentView.swift
//  GettingStartedWithPython
//
//  Created by Adin Ackerman on 1/13/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: Presentation
    
    var body: some View {
        PresentationView()
            .environmentObject(model)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
