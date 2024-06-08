//
//  ContentView.swift
//  RebuildPopularUIScreensInSwiftUI
//
//  Created by enesozmus on 8.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Properties
    @State private var users: [UserModel] = []
    @State private var products: [MainModel] = []
    
    // MARK: BODY
    var body: some View {
        ScrollView {
            VStack {
                ImageLoaderView(urlString: Constants.randomImage)
                    .frame(width: 100, height: 100)
                
                ForEach(users) { product in
                    Text(product.email)
                }
            }
            .padding()
            .task {
                print("task -> 1")
                await getData()
            }
        }
    }
    
    // MARK: Functions
    private func getData() async {
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        } catch let error {
            print("Error -> \(error.localizedDescription)")
        }
    }
}

// MARK: Preview
#Preview {
    ContentView()
}
