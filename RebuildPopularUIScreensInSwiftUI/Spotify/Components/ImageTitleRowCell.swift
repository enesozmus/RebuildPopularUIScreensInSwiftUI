//
//  ImageTitleRowCell.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 17.06.2024.
//

import SwiftUI

struct ImageTitleRowCell: View {
    
    // MARK: Properties
    var imageSize: CGFloat = 100
    var imageName: String = Constants.randomImage
    var title: String = "Some Random Item Name"
    
    // MARK: BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
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
                .frame(width: imageSize, height: imageSize)
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
                .lineLimit(2)
                .padding(4)
        }
        .frame(width: imageSize)
    }
}

// MARK: Preview
#Preview {
    ImageTitleRowCell()
}
