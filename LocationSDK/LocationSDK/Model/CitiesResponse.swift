import Foundation

// MARK: - CitiesReponse
struct CitiesReponse: Codable {
    let cities: [City]
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let malls: [Mall]
}

// MARK: - Mall
struct Mall: Codable {
    let id: Int
    let name: String
    let shops: [Shop]
}

// MARK: - Shop
struct Shop: Codable {
    let id: Int
    let name: String
}
