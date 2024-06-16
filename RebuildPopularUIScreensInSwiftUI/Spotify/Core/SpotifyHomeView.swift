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
    @State private var songRows: [MockSongRow] = []
    
    @State private var selectedCategory: SpotifyCategory = SpotifyCategory.all
    @State private var selectedIndex: Int = 0
    
    @State private var numImages: Double = 8
    var imageNames: [String] {
        Array(1...Int(numImages)).map {"spotify\($0)"}
    }
    var songNames: [String] {
        ["Astronaut in the Ocean Masked Wolf", "Faded Alan Walker", "Let Me Go No Method", "Lost on You LP", "Diamonds Rihanna", "Believer Imagine Dragons", "Djadja", "One Dance"]
    }
    var singerNames: [String] {
        ["Masked Wolf", "Alan Walker", "No Method", "LP", "Rihanna", "Imagine Dragons", "Aya Nakamura", "Drake"]
    }
    
    
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
                                //tempSquares
                                recentsSection
                                    .padding(.horizontal, 16)
                                if let song = songs.first {
                                    newReleaseSection(mainModel: song)
                                        .padding(.horizontal, 16)
                                }
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
    //    private var tempSquares: some View {
    //        if selectedIndex == 0 {
    //            ForEach(0...20) { _ in
    //                Rectangle()
    //                    .fill(.green)
    //                    .frame(width: 200, height: 200)
    //            }
    //        } else if selectedIndex == 1 {
    //            ForEach(0...20) { _ in
    //                Rectangle()
    //                    .fill(.purple)
    //                    .frame(width: 200, height: 200)
    //            }
    //        } else if selectedIndex == 2 {
    //            ForEach(0...20) { _ in
    //                Rectangle()
    //                    .fill(.white)
    //                    .frame(width: 200, height: 200)
    //            }
    //        } else if selectedIndex == 3 {
    //            ForEach(0...20) { _ in
    //                Rectangle()
    //                    .fill(.pink)
    //                    .frame(width: 200, height: 200)
    //            }
    //        } else {
    //            ForEach(0...20) { _ in
    //                Rectangle()
    //                    .fill(.yellow)
    //                    .frame(width: 200, height: 200)
    //            }
    //        }
    //    }
    @ViewBuilder
    private var recentsSection: some View {
        if selectedIndex == 0 {
            a
        } else if selectedIndex == 1 {
            b
        } else if selectedIndex == 2 {
            b
        } else if selectedIndex == 3 {
            b
        } else {
            b
        }
    }
    // ... 🟢
    private var a: some View {
        NonLazyVGrid(columns: 2,alignment: .center, spacing: 10, items: songRows) { row in
            if let row {
                SpotifyRecentsCell(
                    imageName: row.coverImage,
                    song: row.songName,
                    singer: row.singerName
                )
                .asButton(.press) {
                    //goToPlaylistView(product: product)
                }
            }
        }
    }
    // ... 🟢
    private var b: some View {
        NonLazyVGrid(columns: 2,alignment: .center, spacing: 10, items: songRows.shuffled()) { row in
            if let row {
                SpotifyRecentsCell(
                    imageName: row.coverImage,
                    song: row.songName,
                    singer: row.singerName
                )
                .asButton(.press) {
                    //goToPlaylistView(product: product)
                }
            }
        }
    }
    // ... 🔵
    
    
    // MARK: Functions
    private func getMockData() async {
        do {
            // ... user
            currentUser = try await DatabaseHelper().getUsers().first
            
            // ... songs
            songs = try await Array(DatabaseHelper().getProducts().prefix(8))
            
            // ... row
            var rows: [MockSongRow] = []
            
            let zipArray = Array(zip(songNames, imageNames))
            
            for(index, tuple) in zipArray.enumerated() {
                rows.append(MockSongRow(songName: tuple.0, singerName: singerNames[index], products: songs, coverImage: tuple.1))
                
                // ... 🟢
                //rows.append(MockSongRow(songName: songName, singerName: singerNames[i], products: songs, coverImage: imageName))
            }
            songRows = rows
        } catch let error {
            print("getMockData() -> \(error.localizedDescription)")
        }
    }
    private func newReleaseSection(mainModel: MainModel) -> some View {
        SpotifyNewReleaseCell(
            //imageName: mainModel.firstImage,
            //headline: product.brand,
            //title: product.title,
            //subheadline: mainModel.category.rawValue.lowercased(),
            imageName: "spotify3",
            headline: "Pop Rising",
            subheadline: "HOT HITS",
            title: "Pop Rising",
            subtitle: "Who's now and next in pop.",
            onAddToPlaylistPressed: {
            },
            onPlayPressed: {
                //goToPlaylistView(product: product)
            }
        )
    }
}


// MARK: Preview
#Preview {
    SpotifyHomeView()
}
