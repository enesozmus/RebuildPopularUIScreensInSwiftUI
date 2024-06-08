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
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    @State private var fullHeaderSize: CGSize = .zero
    
    @State private var mockNetflix: MainModel? = MainModel.mockNetflix
    
    @State private var firstUser: UserModel? = nil
    @State private var movieRows: [MockRow] = []
    
    // MARK: BODY
    var body: some View {
        ZStack(alignment: .top) {
            // ... background
            Color.netflixBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                VStack(spacing: 8) {
                    Rectangle()
                        .opacity(0)
                        .frame(height: fullHeaderSize.height)
                    if let mockNetflix {
                        heroCell(model: mockNetflix)
                    }
                    ForEach(0..<18) { _ in
                        Rectangle()
                            .fill(.pink)
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            // ... content
            VStack(spacing: 0) {
                header
                    .padding(.horizontal, 16)
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
            }
            .background(.blue)
            .readingFrame { frame in
                if fullHeaderSize == .zero {
                    fullHeaderSize = frame.size
                }
            }
            
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
    private var header: some View {
        HStack(spacing: 8) {
            Text("For You")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
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
            title: model.title,
            categories: ["Action/Adventure"],
            onBackgroundPressed: {
                //onProductPressed(product: product)
            },
            onPlayPressed: {
                //onProductPressed(product: product)
            },
            onMyListPressed: {
            }
        )
        .padding(24)
    }
    
    // MARK: Functions
    private func getMockData() async {
        guard movieRows.isEmpty else { return }
        do {
            // ... user
            firstUser = try await DatabaseHelper().getUsers().first
            // ... products
            let movies = try await DatabaseHelper().getProducts()
            // mockNetflix = movies.first
            
            // ... row
            var rows: [MockRow] = []
            let allBrands = Set(movies.map({$0.brand}))
            for brand in allBrands {
                rows.append(MockRow(title: brand?.capitalized ?? "error", products: movies, images: [""]))
            }
            movieRows = rows
        } catch let error {
            print("getMockData() -> \(error.localizedDescription)")
        }
    }
}

// MARK: Preview
#Preview {
    RouterView { _ in
        NetflixHomeView()
    }
}
