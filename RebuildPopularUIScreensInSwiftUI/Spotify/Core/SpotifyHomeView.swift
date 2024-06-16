//
//  SpotifyHomeView.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 16.06.2024.
//

import SwiftfulRouting
import SwiftfulUI
import SwiftUI

struct SpotifyHomeView: View {
    
    // MARK: Properties
    @Environment(\.router) var router
    
    @State private var currentUser: UserModel? = nil
    @State private var songs: [MainModel] = []
    
    @State private var selectedCategory: SpotifyCategory = SpotifyCategory.all
    @State private var selectedIndex: Int = 0
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            ZStack {
                // ... background
                Color.spotifyBlack.ignoresSafeArea()
                
                // ... content
                ScrollView(.vertical) {
                    LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders]) {
                        Section {
                            VStack(spacing: 16) {
                                tempSquares
                            }
                        } header: {
                            header
                        }
                    }
                    .padding(.top, 8)
                }
                .scrollIndicators(.hidden)
                .clipped()
            }
            .task {
                await getMockData()
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}


// MARK: Extension
extension SpotifyHomeView {
    // ... 🔵
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            router.dismissScreen()
                        }
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Array(SpotifyCategory.allCases.enumerated()), id: \.offset) { index, spotifyCategory in
                        SpotifyCategoryCell(
                            title: spotifyCategory.rawValue.capitalized,
                            isSelected: spotifyCategory == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = spotifyCategory
                            selectedIndex = index
                            print("Index -> \(index)")
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .frame(maxWidth: .infinity)
        .background(.spotifyBlack)
    }
    // ... 🔵
    private var tempSquares: some View {
        if selectedIndex == 0 {
            ForEach(0...20) { _ in
                Rectangle()
                    .fill(.green)
                    .frame(width: 200, height: 200)
            }
        } else if selectedIndex == 1 {
            ForEach(0...20) { _ in
                Rectangle()
                    .fill(.purple)
                    .frame(width: 200, height: 200)
            }
        } else if selectedIndex == 2 {
            ForEach(0...20) { _ in
                Rectangle()
                    .fill(.white)
                    .frame(width: 200, height: 200)
            }
        } else if selectedIndex == 3 {
            ForEach(0...20) { _ in
                Rectangle()
                    .fill(.pink)
                    .frame(width: 200, height: 200)
            }
        } else {
            ForEach(0...20) { _ in
                Rectangle()
                    .fill(.yellow)
                    .frame(width: 200, height: 200)
            }
        }
    }
    
    // MARK: Functions
    private func getMockData() async {
        do {
            // ... user
            currentUser = try await DatabaseHelper().getUsers().first
        } catch let error {
            print("getMockData() -> \(error.localizedDescription)")
        }
    }
}


// MARK: Preview
#Preview {
    SpotifyHomeView()
}
