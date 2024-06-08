//
//  NetflixHomeView.swift
//  RebuildPopularUIScreens
//
//  Created by enesozmus on 8.06.2024.
//

import SwiftfulRouting
import SwiftfulUI
import SwiftUI

struct NetflixHomeView: View {
    
    // MARK: Properties
    @Environment(\.router) var router
    
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    @State private var fullHeaderSize: CGSize = .zero
    @State private var scrollViewOffset: CGFloat = 0
    
    @State private var firstUser: UserModel? = nil
    @State private var firstMovie: MainModel? = nil
    
    @State private var mockNetflix: MainModel? = MainModel.mockNetflix
    @State private var movieRows: [MockRow] = []
    
    @State private var numImages: Double = 9
    var imageNames: [String] {
        Array(1...Int(numImages)).map {"netflix\($0)"}
    }
    var movieNames: [String] {
        ["Top Gun: Maverick", "Avengers: Endgame", "Under Paris", "Mad Max: Fury Road", "365 Days", "No Hard Feelings", "D-Day: 80th Anniversary", "Exhuma", "Godzilla Vs. Kong"]
    }
    var movieGenres: [String] {
        ["Action", "Adventure", "Animation", "Biography", "Comedy", "Crime" , "Documentary", "Drama", "Family", "Fantasy", "Film-Noir", "History", "Horror", "Music", "Musical", "Mystery", "Romance", "Sci-Fi", "Short", "Sport", "Thriller", "War", "Western"]
    }
    
    // MARK: BODY
    var body: some View {
        ZStack(alignment: .top) {
            // ... background
            Color.netflixBlack.ignoresSafeArea()
            
            // ... content
            backgroundGradientLayer
            scrollViewLayer
            fullHeaderWithFilter
            
        }
        .foregroundStyle(.netflixWhite)
        .task {
            await getMockData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
}

// MARK: Extension
extension NetflixHomeView {
    // ... 🔵
    private var backgroundGradientLayer: some View {
        ZStack {
            LinearGradient(colors: [.netflixDarkGray.opacity(1), .netflixDarkGray.opacity(0)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            LinearGradient(colors: [.netflixDarkRed.opacity(0.5), .netflixDarkRed.opacity(0)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        }
        .frame(maxHeight: max(10, (400 + (scrollViewOffset * 0.75))))
        .opacity(scrollViewOffset < -250 ? 0 : 1)
        .animation(.easeInOut, value: scrollViewOffset)
    }
    // ... 🔵
    private var scrollViewLayer: some View {
        ScrollViewWithOnScrollChanged(
            .vertical,
            showsIndicators: false,
            content: {
                VStack(spacing: 8) {
                    Rectangle()
                        .opacity(0)
                        .frame(height: fullHeaderSize.height)
                    
                    if let firstMovie {
                        heroCell(model: firstMovie)
                    }
                    
                    categoryRows
                }
            },
            onScrollChanged: { offset in
                scrollViewOffset = min(0, offset.y)
            }
        )
    }
    // ... 🔵
    private var fullHeaderWithFilter: some View {
        VStack(spacing: 0) {
            header
                .padding(.horizontal, 16)
            
            if scrollViewOffset > -20 {
                NetflixFilterBarView(
                    filters: filters,
                    selectedFilter: selectedFilter,
                    onFilterPressed: { newFilter in
                        selectedFilter = newFilter
                    },
                    onXMarkPressed: {
                        selectedFilter = nil
                    }
                )
                .padding(.top, 16)
                .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .padding(.bottom, 8)
        .background(
            ZStack {
                if scrollViewOffset < -70 {
                    Rectangle()
                        .fill(Color.clear)
                        .background(.ultraThinMaterial)
                        .brightness(-0.2)
                        .ignoresSafeArea()
                }
            }
        )
        .animation(.smooth, value: scrollViewOffset)
        .readingFrame { frame in
            if fullHeaderSize == .zero {
                fullHeaderSize = frame.size
            }
        }
    }
    // ... 🔵
    private var header: some View {
        HStack(spacing: 8) {
            Text("For You")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
                .onTapGesture {
                    router.dismissScreen()
                }
            
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                    }
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                    }
            }
            .font(.title2)
        }
    }
    // ... 🔵
    private func heroCell(model: MainModel) -> some View {
        NetflixHeroCell(
            isNetflixFilm: true,
            //title: model.title,
            title: "Top Gun: Maverick",
            categories: ["Action/Adventure"],
            onBackgroundPressed: {
                onMoviePressed(model: model)
            },
            onPlayPressed: {
                onMoviePressed(model: model)
            },
            onMyListPressed: {
            }
        )
        .padding(24)
    }
    // ... 🔵
    private var categoryRows: some View {
        LazyVStack(spacing: 16) {
            ForEach(Array(movieRows.enumerated()), id: \.offset) { (rowIndex, row) in
                VStack(alignment: .leading, spacing: 6) {
                    //Text(row.products[rowIndex].title)
                    Text(returnRandomMovieTitles(rowIndex))
                        .font(.headline)
                        .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(Array(movieRows.enumerated()), id: \.offset) { (rowIndex, row) in
                                NetflixMovieCell(
                                    imageName: row.images.first ?? Constants.randomImage,
                                    title: row.title,
                                    isRecentlyAdded: row.products[rowIndex].recentlyAdded,
                                    topTenRanking: rowIndex + 1
                                )
                                .onTapGesture {
                                    onMoviePressed(model: row.products[rowIndex])
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
    }
    
    // MARK: Functions
    private func getMockData() async {
        guard movieRows.isEmpty else { return }
        do {
            // ... user
            firstUser = try await DatabaseHelper().getUsers().first
            // ... mock-movies
            let movies = try await DatabaseHelper().getProducts()
            firstMovie = movies.first
            
            // ... row
            var rows: [MockRow] = []
            for (image, name) in zip(imageNames, movieNames) {
                rows.append(MockRow(title: name, products: movies, images: [image]))
            }
            movieRows = rows
        } catch let error {
            print("getMockData() -> \(error.localizedDescription)")
        }
    }
    private func onMoviePressed(model: MainModel) {
        router.showScreen(.sheet) { _ in
            NetflixMovieDetailsView(model: model)
        }
    }
    //    private func returnRandomBoolean() -> Bool {
    //        return Int.random(in: 1...4) == 1
    //    }
    private func returnRandomNumbers() -> Int {
        return Int.random(in: 1...10)
    }
    private func returnRandomMovieTitles(_ randomIndex: Int) -> String {
        if let randomGenre = movieGenres.randomElement() {
            return randomGenre
        }
        return "error"
    }
    
}

// MARK: Preview
#Preview {
    RouterView { _ in
        NetflixHomeView()
    }
}
