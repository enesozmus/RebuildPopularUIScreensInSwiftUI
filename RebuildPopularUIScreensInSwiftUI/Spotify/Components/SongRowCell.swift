//
//  SongRowCell.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 18.06.2024.
//

import SwiftUI

struct SongRowCell: View {
    
    // MARK: Properties
    var imageSize: CGFloat = 50
    var imageName: String = Constants.randomImage
    var title: String = "Some title goes here"
    var subtitle: String? = "Some artist name"
    var onCellPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    
    
    // MARK: BODY
    var body: some View {
        HStack(spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                if let subtitle {
                    Text(subtitle)
                        .font(.callout)
                }
            }
            .foregroundStyle(.spotifyLightGray)
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .background(.spotifyBlack.opacity(0.001))
                .onTapGesture {
                    onEllipsisPressed?()
                }
        }
        .background(.spotifyBlack.opacity(0.001))
        .onTapGesture {
            onCellPressed?()
        }
    }
}


// MARK: Preview
#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        
        VStack {
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
        }
    }
}
