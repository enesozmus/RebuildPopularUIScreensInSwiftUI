//
//  BumbleHeartView.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 9.06.2024.
//

import SwiftUI

struct BumbleHeartView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.bumbleYellow)
                .frame(width: 40, height: 40)
            Image(systemName: "bubble.fill")
                .foregroundStyle(.bumbleBlack)
                .font(.system(size: 22))
                .offset(y: 2)
            Image(systemName: "heart.fill")
                .foregroundStyle(.bumbleYellow)
                .font(.system(size: 10))
        }
    }
}

// MARK: Preview
#Preview {
    BumbleHeartView()
}
