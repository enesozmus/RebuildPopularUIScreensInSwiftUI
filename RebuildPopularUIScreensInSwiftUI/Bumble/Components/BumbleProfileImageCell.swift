//
//  BumbleProfileImageCell.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 11.06.2024.
//

import SwiftUI

struct BumbleProfileImageCell: View {
    
    // MARK: Properties
    var imageName: String = Constants.randomImage
    var randomPercentageRemaining: Double = Double.random(in: 0...1)
    var hasNewMessage: Bool = true
    
    // MARK: BODY
    var body: some View {
        ZStack {
            Circle()
                .stroke(.bumbleGray, lineWidth: 2)
            Circle()
                .trim(from: 1 - randomPercentageRemaining, to: 1.0)
                //.trim(from: 0, to: randompercentageRemaining)
                .stroke(.bumbleYellow, lineWidth: 4)
                .rotationEffect(Angle(degrees: -90))
                .scaleEffect(x: -1, y: 1, anchor: .center)
            ImageLoaderView(urlString: imageName)
                .clipShape(Circle())
                .padding(5)
        }
        .frame(width: 75, height: 75)
        .overlay(
            ZStack {
                if hasNewMessage {
                    Circle()
                        .fill(.bumbleWhite)
                    Circle()
                        .fill(.bumbleYellow)
                        .padding(4)
                }
            }
            .frame(width: 24, height: 24)
            .offset(x: 2, y: 2)
            , alignment: .bottomTrailing
        )
    }
}

// MARK: Preview
#Preview {
    VStack {
        HStack {
            BumbleProfileImageCell()
            BumbleProfileImageCell(randomPercentageRemaining: 1)
            BumbleProfileImageCell(randomPercentageRemaining: 0)
            BumbleProfileImageCell(hasNewMessage: false)
        }
        Spacer()
            .frame(height: 90)
        VStack {
            BumbleProfileImageCell()
            BumbleProfileImageCell(randomPercentageRemaining: 1)
            BumbleProfileImageCell(randomPercentageRemaining: 0)
            BumbleProfileImageCell(hasNewMessage: false)
        }
    }
}
