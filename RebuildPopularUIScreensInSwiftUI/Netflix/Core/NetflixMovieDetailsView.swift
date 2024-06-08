//
//  NetflixMovieDetailsView.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 8.06.2024.
//

import SwiftfulRouting
import SwiftUI

struct NetflixMovieDetailsView: View {
    
    // MARK: Properties
    @Environment(\.router) var router
    
    var model: MainModel = .mockNetflix
    
    @State private var progress: Double = 0.2
    @State private var isMyList: Bool = false
    @State private var products: [MainModel] = []
    
    // MARK: BODY
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 0) {
                NetflixDetailsHeaderView(
                    imageName: model.firstImage,
                    progress: progress,
                    onAirplayPressed: {
                        
                    },
                    onXMarkPressed: {
                        router.dismissScreen()
                    }
                )
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
                        detailsBodySection
                        buttonsSection
                        productsGridSection
                    }
                    .padding(8)
                }
                .scrollIndicators(.hidden)
                
            }
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

// MARK: Extension
extension NetflixMovieDetailsView {
    // ... 🔵
    private var detailsBodySection: some View {
        NetflixDetailsBodyView(
            title: model.title,
            isNew: true,
            yearReleased: "2024",
            seasonCount: 4,
            hasClosedCaptions: true,
            isTopTen: 6,
            descriptionText: model.description,
            castText: "Cast: Nick, Enes, Your Name, Someone Else",
            onPlayPressed: {
            },
            onDownloadPressed: {
            }
        )
    }
    // ... 🔵
    private var buttonsSection: some View {
        HStack(spacing: 32) {
            MyListButton(isMyList: isMyList) {
                isMyList.toggle()
            }
            
            RateButton { selection in
                // do something with selection
            }
            
            ShareButton()
        }
        .padding(.leading, 32)
    }
    
    // ... 🔵
    private var productsGridSection: some View {
        VStack(alignment: .leading) {
            Text("More Like This")
                .font(.headline)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 3),
                      alignment: .center,
                      spacing: 8,
                      pinnedViews: [],
                      content: {
                ForEach(products) { product in
                    NetflixMovieCell2(
                        imageName: product.firstImage,
                        title: product.title,
                        isRecentlyAdded: product.recentlyAdded,
                        topTenRanking: nil
                    )
                    .onTapGesture {
                        onMoviePressed(model: product)
                    }
                }
            })
        }
        .foregroundStyle(.netflixWhite)
    }
    
    // MARK: Functions
    private func getData() async {
        guard products.isEmpty else { return }
        
        do {
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
    private func onMoviePressed(model: MainModel) {
        router.showScreen(.sheet) { _ in
            NetflixMovieDetailsView(model: model)
        }
    }
}

// MARK: Preview
#Preview {
    RouterView { _ in
        NetflixMovieDetailsView()
    }
}
