//
//  BumbleHomeView.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 9.06.2024.
//

import SwiftfulRouting
import SwiftfulUI
import SwiftUI

struct BumbleHomeView: View {
    
    // MARK: Properties
    @AppStorage("bumble_home_filter") private var selectedFilter = "Everyone"
    @Environment(\.router) var router
    
    @State private var filters: [String] = ["Everyone", "Trending"]
    @State private var allUsers: [UserModel] = []
    @State private var selectedIndex: Int = 0
    @State private var cardOffsets: [Int:Bool] = [:] // UserId : (Direction is Right == TRUE)
    @State private var currentSwipeOffset: CGFloat = 0
    
    // MARK: BODY
    var body: some View {
        ZStack {
            // ... background
            Color.bumbleWhite.ignoresSafeArea()
            
            // ... content
            VStack(spacing: 12) {
                header
                BumbleFilterView(options: filters, selection: $selectedFilter)
                    .background(Divider(), alignment: .bottom)
                Spacer()
            }
            .padding(8)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

// MARK: Extension
extension BumbleHomeView {
    // ... 🔵
    private var header: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        router.dismissScreen()
                    }
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        router.dismissScreen()
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Bumble")
                .font(.title)
                .foregroundStyle(.bumbleYellow)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    router.showScreen(.push) { _ in
                            //...
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .font(.title2)
        .fontWeight(.medium)
        .foregroundStyle(.bumbleBlack)
    }
    // ... 🔵
    
    
    // MARK: Functions
}

// MARK: Preview
#Preview {
    RouterView { _ in
        BumbleHomeView()
    }
}
