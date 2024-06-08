//
//  MyListButton.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 8.06.2024.
//

import SwiftUI

struct MyListButton: View {
    
    // MARK: Properties
    var isMyList: Bool = false
    var onButtonPressed: (() -> Void)? = nil
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Image(systemName: "checkmark")
                    .opacity(isMyList ? 1 : 0)
                    .rotationEffect(Angle(degrees: isMyList ? 0 : 180))

                Image(systemName: "plus")
                    .opacity(isMyList ? 0 : 1)
                    .rotationEffect(Angle(degrees: isMyList ? -180 : 0))
            }
            .font(.title)
            
            Text("My List")
                .font(.caption)
                .foregroundStyle(.netflixLightGray)
        }
        .foregroundStyle(.netflixWhite)
        .padding(8)
        .background(.black.opacity(0.001))
        .animation(.bouncy, value: isMyList)
        .onTapGesture {
            onButtonPressed?()
        }
    }
}

// MARK: Preview - Assistant
fileprivate struct MyListButtonPreview: View {
    
    @State private var isMyList: Bool = false
    
    var body: some View {
        MyListButton(isMyList: isMyList) {
            isMyList.toggle()
        }
    }
}

// MARK: Preview
#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        MyListButtonPreview()
    }
}
