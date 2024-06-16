//
//  SpotifyNewReleaseCell.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 16.06.2024.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    
    // MARK: Properties
    var imageName: String = "spotify3"//Constants.randomImage
    var headline: String? = "New release from"
    var subheadline: String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subtitle: String? = "Single - title"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 16) {
            
            // ... 🔵
            HStack(spacing: 8) {
                //ImageLoaderView(urlString: imageName)
                Rectangle()
                    .opacity(0.001)
                    .overlay(
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .allowsHitTesting(false)
                    )
                    .clipped()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 2) {
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                    }
                    if let subheadline {
                        Text(subheadline)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                    }
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // ... 🔵
            HStack {
                //ImageLoaderView(urlString: imageName)
                Rectangle()
                    .opacity(0.001)
                    .overlay(
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .allowsHitTesting(false)
                    )
                    .clipped()
                    .frame(width: 140, height: 140)
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 2) {
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                        }
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGray)
                        }
                    }
                    .font(.callout)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title3)
                            .padding(4)
                            .background(Color.black.opacity(0.001))
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title)
                    }
                }
                .padding(.trailing, 16)
            }
            .themeColors(isSelected: false)
            .cornerRadius(8)
            .onTapGesture {
                onPlayPressed?()
            }
            
        }
    }
}


// MARK: Preview
#Preview {
    ZStack {
        // ... background
        Color.spotifyBlack.ignoresSafeArea()
        
        // ... content
        SpotifyNewReleaseCell()
    }
}
