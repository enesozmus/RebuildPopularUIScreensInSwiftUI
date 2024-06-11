//
//  BumbleChatPreviewCell.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 11.06.2024.
//

import SwiftUI

struct BumbleChatPreviewCell: View {
    
    // MARK: Properties
    var imageName: String = Constants.randomImage
    var percentageRemaining: Double = Double.random(in: 0...1)
    var hasNewMessage: Bool = true
    var userName: String = "Nick"
    var lastChatMessage: String? = "This is the last mess asdf asdf asdf asdf asdf asdf asdf asdasdf asdf asdf asdf asdf asdf asdf asdf age."
    var isYourMove: Bool = true
    
    // MARK: BODY
    var body: some View {
        HStack(spacing: 16) {
            BumbleProfileImageCell(
                imageName: imageName,
                randomPercentageRemaining: percentageRemaining,
                hasNewMessage: hasNewMessage
            )
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 0) {
                    Text(userName)
                        .foregroundStyle(.bumbleBlack)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    if isYourMove {
                        Text("YOUR MOVE")
                            .font(.caption2)
                            .bold()
                            .padding(.vertical, 4)
                            .padding(.horizontal, 6)
                            .background(.bumbleYellow)
                            .clipShape(RoundedRectangle(cornerRadius: 32))
                    }
                }
                if let lastChatMessage {
                    Text(lastChatMessage)
                        .font(.subheadline)
                        .foregroundStyle(.bumbleGray)
                        .padding(.trailing, 16)
                }
            }
            .lineLimit(1)
        }
    }
}

// MARK: Preview
#Preview {
    BumbleChatPreviewCell()
        .padding()
}
