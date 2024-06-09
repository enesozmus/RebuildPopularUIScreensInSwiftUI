//
//  InterestPillView.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 9.06.2024.
//

import SwiftUI

struct InterestPillView: View {
    
    // MARK: Properties
    var iconName: String? = "heart.fill"
    var emoji: String? = "🤙"
    var text: String = "Graduate Degree"
    
    // MARK: BODY
    var body: some View {
        HStack(spacing: 4) {
            if let iconName {
                Image(systemName: iconName)
            } else if let emoji {
                Text(emoji)
            }
            Text(text)
        }
        .font(.callout)
        .fontWeight(.medium)
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        .foregroundStyle(.bumbleBlack)
        .background(.bumbleLightYellow)
        .clipShape(RoundedRectangle(cornerRadius: 32))
    }
}

// MARK: Preview
#Preview {
    VStack {
        InterestPillView(iconName: nil)
        InterestPillView()
    }
}
