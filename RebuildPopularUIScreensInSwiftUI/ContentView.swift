//
//  ContentView.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 8.06.2024.
//

import SwiftfulRouting
import SwiftfulUI
import SwiftUI

struct ContentView: View {
    
    // MARK: Properties
    @Environment(\.router) var router
    
    // MARK: BODY
    var body: some View {
        List {
            Button {
                router.showScreen(.fullScreenCover) { _ in
                    NetflixHomeView()
                }
            } label: {
                Text("Open Netflix")
            }
            Button {
                router.showScreen(.fullScreenCover) { _ in
                    BumbleHomeView()
                }
            } label: {
                Text("Open Bumble")
            }
            
        }
    }
}

// MARK: Preview
#Preview {
    RouterView { _ in
        ContentView()
    }
}
