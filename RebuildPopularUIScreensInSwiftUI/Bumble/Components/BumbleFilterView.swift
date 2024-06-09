//
//  BumbleFilterView.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 9.06.2024.
//

import SwiftUI

struct BumbleFilterView: View {
    
    // MARK: Properties
    var options: [String] = ["Everyone", "Trending"]
    @Binding var selection: String
    @Namespace private var namespace
    
    // MARK: BODY
    var body: some View {
        HStack(alignment: .top, spacing: 32) {
            ForEach(options, id: \.self) { option in
                VStack(spacing: 8) {
                    Text(option)
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    if selection == option {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "selection", in: namespace)
                    }
                }
                .padding(.top, 8)
                .background(.black.opacity(0.001))
                .foregroundStyle(selection == option ? .bumbleBlack : .bumbleGray)
                .onTapGesture {
                    selection = option
                }
            }
        }
        .animation(.smooth, value: selection)
    }
}

// MARK: Preview - Assistant
fileprivate struct BumbleFilterViewPreview: View {
    
    var options: [String] = ["Everyone", "Trending", "Hello"]
    @State private var selection = "Hello"
    
    var body: some View {
        BumbleFilterView(options: options, selection: $selection)
    }
}

// MARK: Preview
#Preview {
    BumbleFilterViewPreview()
        .padding()
}
