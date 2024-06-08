//
//  NetflixHeroCell.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 8.06.2024.
//

import SwiftfulUI
import SwiftUI

struct NetflixHeroCell: View {
    
    // MARK: Properties
    //var imageName: String = Constants.randomImage
    var maverickImage: String = "MaverickSquare"
    var isNetflixFilm: Bool = true
    var title: String = "Players"
    var categories: [String] = ["Raunchy", "Romantic", "Comedy"]
    var onBackgroundPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    var onMyListPressed: (() -> Void)? = nil
    
    // MARK: BODY
    var body: some View {
        ZStack(alignment: .bottom) {
            //ImageLoaderView(urlString: imageName)
            backgroundImage
            
            VStack(spacing: 16) {
                nFilm
                categoriesForHeroCell
                playMyList
            }
            .padding(24)
            .background(
                LinearGradient(
                    colors: [
                        .netflixBlack.opacity(0),
                        .netflixBlack.opacity(0.4),
                        .netflixBlack.opacity(0.4),
                        .netflixBlack.opacity(0.4),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
        .foregroundStyle(.netflixWhite)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .aspectRatio(0.8, contentMode: .fit)
        .asButton(.tap) {
            onBackgroundPressed?()
        }
    }
}

// MARK: Extension
extension NetflixHeroCell {
    private var backgroundImage: some View {
        Rectangle()
            .opacity(0.001)
            .overlay(
                Image(maverickImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 600, height: 600)
            )
            .clipped()
    }
    private var nFilm: some View {
        VStack(spacing: 0) {
            if isNetflixFilm {
                HStack(spacing: 8) {
                    Text("N")
                        .foregroundStyle(.netflixRed)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                    Text("FILM")
                        .kerning(3)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.netflixWhite)
                }
            }
            
            Text(title)
                .font(.system(size: 50, weight: .medium, design: .serif))
        }
    }
    private var categoriesForHeroCell: some View {
        HStack(spacing: 8) {
            ForEach(categories, id: \.self) { category in
                Text(category)
                    .font(.callout)
                
                if category != categories.last {
                    Circle()
                        .frame(width: 4, height: 4)
                }
            }
        }
    }
    private var playMyList: some View {
        HStack(spacing: 16) {
            HStack {
                Image(systemName: "play.fill")
                Text("Play")
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .foregroundStyle(.netflixDarkGray)
            .background(.netflixWhite, in: RoundedRectangle(cornerRadius: 4))
            .asButton(.press) {
                onPlayPressed?()
            }
            
            HStack {
                Image(systemName: "plus")
                Text("My List")
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .foregroundStyle(.netflixWhite)
            .background(.netflixDarkGray, in: RoundedRectangle(cornerRadius: 4))
            .asButton(.press) {
                onMyListPressed?()
            }
        }
        .font(.callout)
        .fontWeight(.medium)
    }
}

// MARK: Preview
#Preview {
    NetflixHeroCell()
        .padding(40)
}
