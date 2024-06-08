//
//  NetflixFilterCell.swift
//  RebuildPopularUIScreens
//
//  Created by enesozmus on 8.06.2024.
//

import SwiftUI

struct NetflixFilterCell: View {
    
    // MARK: Properties
    var title: String = "Categories"
    var isDropdown: Bool = true
    var isSelected: Bool = false
    
    // MARK: BODY
    var body: some View {
        HStack(spacing: 4) {
            Text(title)
            if isDropdown {
                Image(systemName: "chevron.down")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            ZStack {
                Capsule(style: .circular)
                    .fill(.netflixDarkRed)
                    .opacity(isSelected ? 1 : 0)
                Capsule(style: .circular)
                    .stroke(lineWidth: 1.0)
            }
        )
        .foregroundStyle(.netflixLightGray)
    }
}

// MARK: Preview
#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        
        VStack {
            NetflixFilterCell()
            NetflixFilterCell(isSelected: true)
            NetflixFilterCell(isDropdown: false)
        }
    }
}
