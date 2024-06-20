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
    
    @State private var songs: [MainModel] = []
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
                    ForEach(songs) { song in
                        SongRowCell(
                            imageSize: 50,
                            imageName: song.firstImage,
                            title: song.title,
                            subtitle: song.brand ?? "",
                            onCellPressed: {
                                goToPlaylistView(song: song)
                            },
                            onEllipsisPressed: {
                            }
                        )
                        .padding(.leading, 16)
                    }
                }
            }
            .scrollIndicators(.hidden)
            header
                .frame(maxHeight: .infinity, alignment: . top)
        }
        .task {
            await getMockData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

// MARK: Extension
extension SpotifyPlaylistView {
    // ... 🔵
    private var header: some View {
        ZStack {
            Text(song.title)
                .font(.headline)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(Color.spotifyBlack)
                .offset(y: showHeader ? 0 : -40)
                .opacity(showHeader ? 1 : 0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ? Color.black.opacity(0.001) : Color.spotifyGray.opacity(0.7))
                .clipShape(Circle())
                .onTapGesture {
                    router.dismissScreen()
                }
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(.spotifyWhite)
        .animation(.smooth(duration: 0.2), value: showHeader)
    }
    
    // MARK: Functions
    private func getMockData() async {
        do {
            songs = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
    private func goToPlaylistView(song: MainModel) {
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(song: song, user: user)
        }
    }
}


// MARK: Preview
#Preview {
    RouterView { _ in
        SpotifyPlaylistView()
    }
}
