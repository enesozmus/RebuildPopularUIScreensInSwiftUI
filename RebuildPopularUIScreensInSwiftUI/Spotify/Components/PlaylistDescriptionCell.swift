//
//  PlaylistDescriptionCell.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 18.06.2024.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    
    // MARK: Properties
    var descriptionText: String = MainModel.mockSpotify.brand ?? "safe"
    var userName: String = "EnesOzmus"
    var subheadline: String = "Some headline goes here"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    var onSharePressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    var onShufflePressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    
    // MARK: BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(descriptionText)
                .frame(maxWidth: .infinity, alignment: .leading)
            madeForYouSection
            Text(subheadline)
            buttonsRow
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spotifyLightGray)
    }
}


// MARK: Extension
extension PlaylistDescriptionCell {
    // ... 🔵
    private var madeForYouSection: some View {
        HStack(spacing: 8) {
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.spotifyGreen)
            Text("Made for ") + Text(userName).bold().foregroundStyle(.spotifyWhite)
        }
    }
    // ... 🔵
    private var buttonsRow: some View {
        HStack(spacing: 8) {
            HStack(spacing: 8) {
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(.spotifyBlack.opacity(0.0001))
                    .onTapGesture {
                    }
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(.spotifyBlack.opacity(0.0001))
                    .onTapGesture {
                    }
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(.spotifyBlack.opacity(0.0001))
                    .onTapGesture {
                    }
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(.spotifyBlack.opacity(0.0001))
                    .onTapGesture {
                    }
            }
            .offset(x: -8)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 8) {
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                    .background(.spotifyBlack.opacity(0.0001))
                    .onTapGesture {
                    }
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 46))
                    .background(.spotifyBlack.opacity(0.0001))
                    .onTapGesture {
                    }
            }
            .foregroundStyle(.spotifyGreen)
        }
        .font(.title2)
    }
}


// MARK: Preview
#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        
        PlaylistDescriptionCell()
            .padding()
    }
}
