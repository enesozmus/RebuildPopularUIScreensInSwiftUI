//
//  ImageLoaderView.swift
//  RebuildPopularUIScreens
//
//  Created by enesozmus on 8.06.2024.
//

import SwiftUI

import SDWebImageSwiftUI
import SwiftUI

struct ImageLoaderView: View {
    
    // MARK: Properties
    var urlString: String = Constants.randomImage
    var resizingMode: ContentMode = .fill
    
    // MARK: BODY
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay(
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            )
            .clipped()
    }
}

// MARK: Preview
#Preview {
    ImageLoaderView()
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(40)
        .padding(.vertical, 60)
}
