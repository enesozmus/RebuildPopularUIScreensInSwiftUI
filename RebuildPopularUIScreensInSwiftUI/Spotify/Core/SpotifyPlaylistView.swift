//
//  SpotifyPlaylistView.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 18.06.2024.
//

import SwiftfulRouting
import SwiftfulUI
import SwiftUI

struct SpotifyPlaylistView: View {
    
    // MARK: Properties
    @Environment(\.router) var router
    var song: MainModel = MainModel.mockSpotify
    var user: UserModel = .mock
    
    //@State private var mainModels: [MainModel] = []
    @State private var showHeader: Bool = true
    
    
    // MARK: BODY
    var body: some View {
        ZStack {
            // ... background
            Color.spotifyBlack.ignoresSafeArea()
            
            // ... content
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(
                        height: 250,
                        title: song.title,
                        subtitle: song.description,
                        imageName: song.images[0]
                    )
                    .readingFrame { frame in
                        showHeader = frame.maxY < 150
                    }
                    PlaylistDescriptionCell(
                        descriptionText: "Pop Rising",
                        userName: user.firstName,
                        subheadline: "Songs",
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
                }
            }
            .scrollIndicators(.hidden)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

// MARK: Extension
extension SpotifyPlaylistView {
    
}


// MARK: Preview
#Preview {
    RouterView { _ in
        SpotifyPlaylistView()
    }
}
