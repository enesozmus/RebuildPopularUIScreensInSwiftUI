//
//  UserModel.swift
//  RebuildPopularUIScreens
//
//  Created by enesozmus on 8.06.2024.
//

import Foundation

// MARK: - Welcome
struct UserArray: Codable {
    let users: [UserModel]
    let total, skip, limit: Int
}
/// https://dummyjson.com/users
///
///
///
// MARK: - User
struct UserModel: Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let gender: Gender
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height, weight: Double
    let eyeColor: String
    let hair: Hair
    let ip: String
    let address: Address
    let macAddress, university: String
    let bank: Bank
    let company: Company
    let ein, ssn, userAgent: String
    let crypto: Crypto
    let role: Role
    
    // mock additions
    var aboutMe: String {
        "This is a sentence about me that will look good on my profile!"
    }
    var basics: [UserInterest] {
        [
            UserInterest(iconName: "ruler", emoji: nil, text: "\(height)"),
            UserInterest(iconName: "graduationcap", emoji: nil, text: "Bursa Uludag University"),
            UserInterest(iconName: "wineglass", emoji: nil, text: "Socially"),
            UserInterest(iconName: "moon.stars.fill", emoji: nil, text: "Virgo"),
        ]
    }
    var interests: [UserInterest] {
        [
            UserInterest(iconName: nil, emoji: "👟", text: "Running"),
            UserInterest(iconName: nil, emoji: "🏋️‍♂️", text: "Gym"),
            UserInterest(iconName: nil, emoji: "🎧", text: "Music"),
            UserInterest(iconName: nil, emoji: "🥘", text: "Cooking"),
        ]
    }
    var images: [String] {
        ["https://picsum.photos/500/500", "https://picsum.photos/600/600", "https://picsum.photos/700/700"]
    }
    
    static var mock: UserModel {
        UserModel(
            id: 001,
            firstName: "Enes",
            lastName: "Ozmus",
            maidenName: "",
            age: 26,
            gender: Gender.male,
            email: "ensozmus@gmail.com",
            phone: "",
            username: "enesozmus",
            password: "",
            birthDate: "",
            image: Constants.randomImage,
            bloodGroup: "",
            height: 70,
            weight: 176,
            eyeColor: "",
            hair: Hair(
                color: "",
                type: TypeEnum.straight
            ),
            ip: "",
            address: Address(
                address: "",
                city: "",
                state: "",
                stateCode: "",
                postalCode: "",
                coordinates: Coordinates(lat: 0, lng: 0),
                country: Country.unitedStates
            ),
            macAddress: "",
            university: "",
            bank: Bank(
                cardExpire: "",
                cardNumber: "",
                cardType: "",
                currency: "",
                iban: ""
            ),
            company: Company(
                department: "",
                name: "",
                title: "",
                address: Address(
                    address: "",
                    city: "",
                    state: "",
                    stateCode: "",
                    postalCode: "",
                    coordinates: Coordinates(lat: 0, lng: 0),
                    country: Country.unitedStates
                )
            ),
            ein: "",
            ssn: "",
            userAgent: "",
            crypto: Crypto(
                coin: Coin.bitcoin,
                wallet: Wallet.the0Xb9Fc2Fe63B2A6C003F1C324C3Bfa53259162181A,
                network: Network.ethereumERC20
            ),
            role: Role.admin
        )
    }
}

// MARK: - Address
struct Address: Codable {
    let address, city, state, stateCode: String
    let postalCode: String
    let coordinates: Coordinates
    let country: Country
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let lat, lng: Double
}

enum Country: String, Codable {
    case unitedStates = "United States"
}

// MARK: - Bank
struct Bank: Codable {
    let cardExpire, cardNumber, cardType, currency: String
    let iban: String
}

// MARK: - Company
struct Company: Codable {
    let department, name, title: String
    let address: Address
}

// MARK: - Crypto
struct Crypto: Codable {
    let coin: Coin
    let wallet: Wallet
    let network: Network
}

enum Coin: String, Codable {
    case bitcoin = "Bitcoin"
}

enum Network: String, Codable {
    case ethereumERC20 = "Ethereum (ERC20)"
}

enum Wallet: String, Codable {
    case the0Xb9Fc2Fe63B2A6C003F1C324C3Bfa53259162181A = "0xb9fc2fe63b2a6c003f1c324c3bfa53259162181a"
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

// MARK: - Hair
struct Hair: Codable {
    let color: String
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case curly = "Curly"
    case kinky = "Kinky"
    case straight = "Straight"
    case wavy = "Wavy"
}

enum Role: String, Codable {
    case admin = "admin"
    case moderator = "moderator"
    case user = "user"
}
