//
//  SpotifyCategoryCell.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 16.06.2024.
//

import SwiftUI

enum SpotifyCategory: String, CaseIterable {
    case all, music, podcasts, festivals, love
}

struct SpotifyCategoryCell: View {
    
    // MARK: Properties
    var title: String = "All"
    var isSelected: Bool = false
    
    // MARK: BODY
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

// MARK: Extension View
extension View {
    func themeColors(isSelected: Bool) -> some View {
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
    }
}

// MARK: Preview
#Preview {
    ZStack {
        // ... background
        Color.spotifyBlack.ignoresSafeArea()
        
        // ... content
        HStack(spacing: 12) {
            SpotifyCategoryCell(title: "All")
            SpotifyCategoryCell(title: "Music")
            SpotifyCategoryCell(title: "Podcast")
        }
    }
}
