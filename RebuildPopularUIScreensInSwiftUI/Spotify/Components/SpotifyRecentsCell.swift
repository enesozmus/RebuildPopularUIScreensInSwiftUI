//
//  SpotifyRecentsCell.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 16.06.2024.
//

import SwiftUI

struct SpotifyRecentsCell: View {
    
    // MARK: Properties
    var imageName: String = "netflix1"
    var song: String = "Believer"
    var singer: String = "Imagine Dragons"
    
    
    // MARK: BODY
    var body: some View {
        HStack(spacing: 16) {
            // ... 🔵
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
                .frame(width: 55, height: 55)
            
            // ... 🔵
            VStack(alignment: .leading, spacing: 2){
                Text(song)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                Text(singer)
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .lineLimit(1)
            }
        }
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColors(isSelected: false)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        
    }
}


// MARK: Preview
#Preview {
    ZStack {
        // ... background
        Color.spotifyBlack.ignoresSafeArea()
        
        // ... content
        VStack {
            HStack {
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
            HStack {
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
        }
    }
}
