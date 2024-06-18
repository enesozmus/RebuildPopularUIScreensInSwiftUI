//
//  PlaylistHeaderCell.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 18.06.2024.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderCell: View {
    
    // MARK: Properties
    var height: CGFloat = 300
    var title: String = "Masked Wolf"
    var subtitle: String = "Astronaut in the Ocean"
    var imageName: String = "spotify1"  //Constants.randomImage"
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    
    // MARK: BODY
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(
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
            )
            .overlay(
                VStack(alignment: .leading, spacing: 8) {
                    Text(subtitle)
                        .font(.headline)
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                    .foregroundStyle(.spotifyWhite)
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        LinearGradient(
                            colors: [shadowColor.opacity(0), shadowColor],
                            startPoint: .top, endPoint: .bottom)
                    )
                , alignment: .bottomLeading
            )
            .asStretchyHeader(startingHeight: height)
    }
}


// MARK: Preview
#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ScrollView {
            PlaylistHeaderCell()
        }
        .ignoresSafeArea()
    }
}
