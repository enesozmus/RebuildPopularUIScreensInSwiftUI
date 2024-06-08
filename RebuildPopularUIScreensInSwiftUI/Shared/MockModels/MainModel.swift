//
//  MainModel.swift
//  RebuildPopularUIScreens
//
//  Created by enesozmus on 8.06.2024.
//

import Foundation

// MARK: - Welcome
struct ProductArray: Codable {
    let products: [MainModel]
    let total, skip, limit: Int
}
/// https://dummyjson.com/products
///
///
///
// MARK: - MainModel
struct MainModel: Codable, Identifiable {
    let id: Int
    let title, description: String
    let category: Category
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let dimensions: Dimensions
    let warrantyInformation, shippingInformation: String
    let availabilityStatus: AvailabilityStatus
    let reviews: [Review]
    let returnPolicy: ReturnPolicy
    let minimumOrderQuantity: Int
    let meta: Meta
    let images: [String]
    let thumbnail: String
    
    // mock-seed-data
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
    static var mockNetflix: MainModel {
        MainModel(
            id: 002,
            title: "Top Gun: Maverick",
            description: "This is some mock product description that goes here.",
            category: Category.beauty,
            price: 999,
            discountPercentage: 15,
            rating: 4.5,
            stock: 50,
            tags: ["", ""],
            brand: "Apple",
            sku: "",
            weight: 0,
            dimensions: Dimensions(
                width: 0,
                height: 0,
                depth: 0
            ),
            warrantyInformation: "",
            shippingInformation: "",
            availabilityStatus: AvailabilityStatus.inStock,
            reviews: [Review(
                rating: 0,
                comment: "",
                date: CreatedAt.the20240523T085621618Z,
                reviewerName: "",
                reviewerEmail: ""
            ) ],
            returnPolicy: ReturnPolicy.noReturnPolicy,
            minimumOrderQuantity: 0,
            meta: Meta(
                createdAt: CreatedAt.the20240523T085621618Z,
                updatedAt: CreatedAt.the20240523T085621618Z,
                barcode: "",
                qrCode: ""
            ),
            images: [Constants.randomImage, Constants.randomImage, Constants.randomImage],
            thumbnail: Constants.randomImage
        )
    }
}

enum AvailabilityStatus: String, Codable {
    case inStock = "In Stock"
    case lowStock = "Low Stock"
}

enum Category: String, Codable {
    case beauty = "beauty"
    case fragrances = "fragrances"
    case furniture = "furniture"
    case groceries = "groceries"
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let width, height, depth: Double
}

// MARK: - Meta
struct Meta: Codable {
    let createdAt, updatedAt: CreatedAt
    let barcode: String
    let qrCode: String
}

enum CreatedAt: String, Codable {
    case the20240523T085621618Z = "2024-05-23T08:56:21.618Z"
    case the20240523T085621619Z = "2024-05-23T08:56:21.619Z"
    case the20240523T085621620Z = "2024-05-23T08:56:21.620Z"
}

enum ReturnPolicy: String, Codable {
    case noReturnPolicy = "No return policy"
    case the30DaysReturnPolicy = "30 days return policy"
    case the60DaysReturnPolicy = "60 days return policy"
    case the7DaysReturnPolicy = "7 days return policy"
    case the90DaysReturnPolicy = "90 days return policy"
}

// MARK: - Review
struct Review: Codable {
    let rating: Int
    let comment: String
    let date: CreatedAt
    let reviewerName, reviewerEmail: String
}

// MARK: - Mock-Row
struct MockRow: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let products: [MainModel]
    let images: [String]
}
