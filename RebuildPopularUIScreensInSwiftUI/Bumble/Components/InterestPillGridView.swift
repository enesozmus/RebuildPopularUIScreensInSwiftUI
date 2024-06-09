//
//  InterestPillGridView.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 9.06.2024.
//

import SwiftfulUI
import SwiftUI

// MARK: User Interests
struct UserInterest: Identifiable {
    let id = UUID().uuidString
    var iconName: String? = nil
    var emoji: String? = nil
    var text: String
}

struct InterestPillGridView: View {
    
    // MARK: Properties
    var interests: [UserInterest] = UserModel.mock.basics
    
    // MARK: BODY
    var body: some View {
        ZStack {
            NonLazyVGrid(columns: 2, alignment: .leading, spacing: 8, items: interests) { interest in
                if let interest {
                    InterestPillView(
                        iconName: interest.iconName,
                        emoji: interest.emoji,
                        text: interest.text
                    )
                } else {
                    EmptyView()
                }
            }
        }
    }
}

// MARK: Preview
#Preview {
    VStack(spacing: 40) {
        InterestPillGridView(interests: UserModel.mock.basics)
        InterestPillGridView(interests: UserModel.mock.interests)
    }
}
