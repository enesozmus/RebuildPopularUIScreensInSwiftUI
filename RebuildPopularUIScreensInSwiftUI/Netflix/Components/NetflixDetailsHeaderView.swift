//
//  NetflixDetailsHeaderView.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 8.06.2024.
//

import SwiftfulUI
import SwiftUI

struct NetflixDetailsHeaderView: View {
    
    // MARK: Properties
    var imageName: String = Constants.randomImage
    var progress: Double = 0.2
    var onAirplayPressed: (() -> Void)? = nil
    var onXMarkPressed: (() -> Void)? = nil
    
    // MARK: BODY
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
            CustomProgressBar(
                selection: progress,
                range: 0...1,
                backgroundColor: .netflixLightGray,
                foregroundColor: .netflixRed,
                cornerRadius: 2,
                height: 4
            )
            .padding(.bottom, 4)
            .animation(.linear, value: progress)
            HStack(spacing: 8) {
                Circle()
                    .fill(.netflixDarkGray)
                    .overlay(
                        Image(systemName: "tv.badge.wifi")
                            .offset(y: 1)
                    )
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        onAirplayPressed?()
                    }
                Circle()
                    .fill(.netflixDarkGray)
                    .overlay(
                        Image(systemName: "xmark")
                            .offset(y: 1)
                    )
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        onXMarkPressed?()
                    }
            }
            .foregroundStyle(.netflixWhite)
            .font(.subheadline)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        }
        .aspectRatio(2, contentMode: .fit)
    }
}

// MARK: Preview
#Preview {
    NetflixDetailsHeaderView()
}
