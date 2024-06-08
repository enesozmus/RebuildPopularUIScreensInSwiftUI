//
//  NetflixMovieCell2.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 8.06.2024.
//

import SwiftUI

struct NetflixMovieCell2: View {
    
    // MARK: Properties
    var width: CGFloat = 90
    var height: CGFloat = 140
    var imageName: String = Constants.randomImage
    var title: String? = "Mad Max: Fury Road"
    var isRecentlyAdded: Bool = false
    var topTenRanking: Int? = nil
    
    // MARK: BODY
    var body: some View {
        HStack(alignment: .bottom, spacing: -8) {
            if let topTenRanking {
                Text("\(topTenRanking)")
                    .font(.system(size: 100, weight: .medium, design: .serif))
                    .offset(y: 20)
            }
            ZStack {
                ImageLoaderView(urlString: imageName)
                
                VStack(spacing: 0) {
                    if let title {
                        Text(title)
                            .font(.caption)
                            .fontWeight(.medium)
                            .lineLimit(2)
                    }
                    Text("Recently Added")
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .padding(.bottom, 2)
                        .frame(maxWidth: .infinity)
                        .background(.netflixRed, in: RoundedRectangle(cornerRadius: 2))
                        .offset(y: 2)
                        .lineLimit(1)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .minimumScaleFactor(0.1)
                        .padding(.horizontal, 8)
                        .opacity(isRecentlyAdded ? 1 : 0)
                }
                .padding(.top, 6)
                .background(
                    LinearGradient(
                        colors: [
                            .netflixBlack.opacity(0),
                            .netflixBlack.opacity(0.3),
                            .netflixBlack.opacity(0.4),
                            .netflixBlack.opacity(0.4),
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .frame(width: width, height: height)
        }
        .foregroundStyle(.netflixWhite)
    }
}

// MARK: Preview
#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        
        ScrollView {
            VStack {
                NetflixMovieCell2(isRecentlyAdded: true)
                NetflixMovieCell2(isRecentlyAdded: false)
                NetflixMovieCell2(isRecentlyAdded: true, topTenRanking: 2)
                NetflixMovieCell2(isRecentlyAdded: false, topTenRanking: 7)
                NetflixMovieCell2(isRecentlyAdded: true, topTenRanking: 10)
                NetflixMovieCell2(isRecentlyAdded: false, topTenRanking: 10)
            }
        }
    }
}
