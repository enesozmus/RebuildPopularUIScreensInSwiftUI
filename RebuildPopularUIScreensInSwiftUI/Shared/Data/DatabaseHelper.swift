//
//  DatabaseHelper.swift
//  RebuildPopularUIScreens
//
//  Created by enesozmus on 8.06.2024.
//

import Foundation

struct DatabaseHelper {
    
    func getProducts() async throws -> [MainModel] {
        print("DatabaseHelper -> getProducts")
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let productArray = try JSONDecoder().decode(ProductArray.self, from: data)
        return productArray.products
    }
    
    func getUsers() async throws -> [UserModel] {
        print("DatabaseHelper -> getUsers")
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode(UserArray.self, from: data)
        return users.users
    }
    
}

/*
     func data(
        from url: URL,
        delegate: (URLSessionTaskDelegate)? = nil
     ) async throws -> (Data, URLResponse)
     
     func decode<T>(
        _ type: T.Type,
        from data: Data
     ) throws -> T where T : Decodable
 */
