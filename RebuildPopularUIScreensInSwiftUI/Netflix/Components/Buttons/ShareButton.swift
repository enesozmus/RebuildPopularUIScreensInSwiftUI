//
//  ShareButton.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 8.06.2024.
//

import SwiftUI

struct ShareButton: View {
    
    // MARK: Properties
    var url: String = "https://www.swiftful-thinking.com"
    
    // MARK: BODY
    @ViewBuilder
    var body: some View {
        if let url = URL(string: url) {
            ShareLink(item: url) {
                VStack(spacing: 8) {
                    Image(systemName: "paperplane")
                        .font(.title)
                    
                    Text("Share")
                        .font(.caption)
                        .foregroundStyle(.netflixLightGray)
                }
                .foregroundStyle(.netflixWhite)
                .padding(8)
                .background(.black.opacity(0.001))
            }
        }
    }
}

// MARK: Preview
#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ShareButton()
    }
}
