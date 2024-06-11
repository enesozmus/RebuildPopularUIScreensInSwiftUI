//
//  BumbleChatsView.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 11.06.2024.
//

import SwiftUI

struct BumbleChatsView: View {
    
    // MARK: Properties
    @Environment(\.router) var router
    
    @State private var allUsers: [UserModel] = []
    
    // MARK: BODY
    var body: some View {
        ZStack {
            // ... background
            Color.bumbleWhite.ignoresSafeArea()
            
            // ... content
            VStack(spacing: 0) {
                header
                    .padding(16)
                matchQueueSection
                    .padding(.vertical, 16)
                recentChatsSection
            }
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

// MARK: Extension
extension BumbleChatsView {
    // ... 🔵
    private var header: some View {
        HStack(spacing: 0) {
            Image(systemName: "line.horizontal.3")
                .onTapGesture {
                    router.dismissScreen()
                }
            Spacer(minLength: 0)
            Image(systemName: "magnifyingglass")
        }
        .font(.title)
        .fontWeight(.medium)
    }
    // ... 🔵
    private var matchQueueSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                Text("Match Queue")
                +
                Text(" (\(allUsers.count))")
                    .foregroundStyle(.bumbleGray)
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(allUsers) { user in
                        BumbleProfileImageCell(
                            imageName: user.images.randomElement()!,
                            randomPercentageRemaining: Double.random(in: 0...1),
                            hasNewMessage: Bool.random()
                        )
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
            .frame(height: 100)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    // ... 🔵
    private var recentChatsSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 0) {
                Group {
                    Text("Chats")
                    +
                    Text(" (Recent)")
                        .foregroundStyle(.bumbleGray)
                }
                
                Spacer(minLength: 0)
                Image(systemName: "line.horizontal.3.decrease")
                    .font(.title2)
            }
            .padding(.horizontal, 16)
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 16) {
                    ForEach(allUsers) { user in
                        BumbleChatPreviewCell(
                            imageName: user.images.randomElement()!,
                            percentageRemaining: Double.random(in: 0...1),
                            hasNewMessage: Bool.random(),
                            userName: user.firstName,
                            lastChatMessage: user.aboutMe,
                            isYourMove: Bool.random()
                        )
                    }
                }
                .padding(16)
            }
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: Functions
    private func getData() async {
        guard allUsers.isEmpty else { return }
        
        do {
            allUsers = try await DatabaseHelper().getUsers()
        } catch {
            
        }
    }
}
// MARK: Preview
#Preview {
    BumbleChatsView()
}
