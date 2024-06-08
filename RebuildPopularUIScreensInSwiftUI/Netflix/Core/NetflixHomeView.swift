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
    
    // MARK: BODY
    var body: some View {
        ZStack {
            // ... background
            Color.netflixBlack.ignoresSafeArea()
            
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
                Spacer()
            }
            .foregroundStyle(.netflixWhite)
        }
    }
}

// MARK: Extension
extension NetflixHomeView {
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
}

// MARK: Preview
#Preview {
    RouterView { _ in
        NetflixHomeView()
    }
}
